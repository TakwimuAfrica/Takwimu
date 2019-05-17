import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography } from '@material-ui/core';

import ContactUsContentNav from './ContactUsContentNav';
import ContentSection from '../ContentSection';
import RichTextSection from '../RichTextSection';

const styles = theme => ({
  root: {
    maxWidth: '933px'
  },
  title: {
    marginBottom: '1.375rem'
  },
  body: {
    padding: '0 19px'
  },
  section: {
    marginTop: '2.5rem',
    paddingTop: '1rem',
    paddingBottom: '1rem',
    borderTop: `4px solid ${theme.palette.primary.main}`
  }
});

function ContactUsContent({
  classes,
  title,
  address,
  keyContacts,
  socialMedia,
  current,
  contentHeadings,
  changeActiveContent
}) {
  return (
    <React.Fragment>
      <ContactUsContentNav
        title={contentHeadings[0].title}
        current={current}
        contentHeadings={contentHeadings}
        changeActiveContent={changeActiveContent}
      />
      <Typography variant="h2" className={classes.title}>
        {title}
      </Typography>
      <ContentSection
        id={contentHeadings[0].link}
        classes={{ root: classes.section }}
        title={contentHeadings[0].title}
        variant="h3"
      >
        {keyContacts.map(keyContact => (
          <Typography>{keyContact.title}</Typography>
        ))}
      </ContentSection>
      <RichTextSection
        id={contentHeadings[1].link}
        classes={{ root: classes.section }}
        title={contentHeadings[1].title}
        value={address}
        component={ContentSection}
      />
      <ContentSection
        id={contentHeadings[2].link}
        classes={{ root: classes.section }}
        title={contentHeadings[2].title}
        variant="h3"
      >
        {Object.keys(socialMedia).map(social => (
          <div>{social}</div>
        ))}
      </ContentSection>
    </React.Fragment>
  );
}

ContactUsContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string.isRequired,
  address: PropTypes.string.isRequired,
  keyContacts: PropTypes.shape({}).isRequired,
  socialMedia: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  changeActiveContent: PropTypes.func.isRequired
};

export default withStyles(styles)(ContactUsContent);
