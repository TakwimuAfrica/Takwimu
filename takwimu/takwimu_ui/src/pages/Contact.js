import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import ContactContent from '../components/ContactContent';
import ContentPage from '../components/ContentPage';
import TableOfContent from '../components/ContactContent/TableOfContent';

const styles = () => ({
  root: {
    marginTop: '2.875rem',
    marginBottom: '4.375rem'
  }
});

function Contact({
  classes,
  takwimu: {
    page: {
      title,
      key_contacts: keyContacts,
      social_media: socialMedia,
      related_content: relatedContent,
      address
    },
    settings
  }
}) {
  const [currentSectionIndex, setCurrentSectionIndex] = useState(0);
  const contentHeadings = [
    { title: 'Key contacts', link: 'key-contacts' },
    { title: 'Address', link: 'address' },
    { title: 'Social', link: 'social' }
  ];

  const changeActiveContent = index => {
    setCurrentSectionIndex(index);
    const activeElement = document.getElementById(contentHeadings[index].link);
    window.scrollTo(0, activeElement.offsetTop - 90);
  };

  useEffect(() => {
    const currentIndex = contentHeadings.findIndex(
      x => x.link === window.location.hash.replace('#', '')
    );
    if (currentIndex !== -1) {
      changeActiveContent(currentIndex);
    }
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
      <ContactContent
        title={title}
        address={address}
        keyContacts={keyContacts}
        socialMedia={socialMedia}
        current={currentSectionIndex}
        contentHeadings={contentHeadings}
        relatedContent={relatedContent}
        changeActiveContent={changeActiveContent}
        settingsSocialMedia={settings.socialMedia}
        settings={settings}
      />
    </ContentPage>
  );
}

Contact.propTypes = {
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

export default withStyles(styles)(Contact);
