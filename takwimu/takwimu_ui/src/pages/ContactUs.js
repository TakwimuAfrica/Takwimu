import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import ContactUsContent from '../components/ContactUsContent';
import ContentPage from '../components/ContentPage';
import TableOfContent from '../components/AboutUsContent/TableOfContent';

const styles = () => ({
  root: {
    marginTop: '2.875rem',
    marginBottom: '4.375rem'
  }
});

function ContactUs({
  classes,
  takwimu: {
    page: { title, key_contacts: keyContacts, social_media: social, address },
    settings: { socialMedia },
    activeContent
  }
}) {
  const [currentSectionIndex, setCurrentSectionIndex] = useState(-1);
  const contentHeadings = [
    { title: 'Key contacts', link: 'key-contacts' },
    { title: 'Address', link: 'address' },
    { title: 'Social', link: 'social' }
  ];

  const changeActiveContent = index => {
    setCurrentSectionIndex(index);
    const activeElement = document.getElementById(contentHeadings[index].link);
    activeElement.scrollIntoView();
  };

  useEffect(() => {
    const currentIndex = contentHeadings.findIndex(
      x => x.link === activeContent
    );
    changeActiveContent(currentIndex);
  }, []);

  return (
    <ContentPage
      aside={
        <TableOfContent
          current={currentSectionIndex}
          contentHeadings={contentHeadings}
          changeActiveContent={changeActiveContent}
        />
      }
      classes={{ root: classes.root }}
    >
      <ContactUsContent
        title={title}
        address={address}
        keyContacts={keyContacts}
        social={social}
        socialMedia={socialMedia}
        current={currentSectionIndex}
        contentHeadings={contentHeadings}
        changeActiveContent={changeActiveContent}
      />
    </ContentPage>
  );
}

ContactUs.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    page: PropTypes.shape({
      title: PropTypes.string.isRequired,
      address: PropTypes.string.isRequired,
      key_contacts: PropTypes.shape({}).isRequired,
      social_media: PropTypes.shape({}).isRequired
    }).isRequired,
    settings: PropTypes.shape({
      socialMedia: PropTypes.shape({}).isRequired
    }).isRequired,
    activeContent: PropTypes.string.isRequired
  }).isRequired
};

export default withStyles(styles)(ContactUs);
