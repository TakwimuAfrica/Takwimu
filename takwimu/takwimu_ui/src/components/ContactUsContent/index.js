import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography, Grid, Link, Icon } from '@material-ui/core';

import ContactUsContentNav from './ContactUsContentNav';
import ContentSection from '../ContentSection';
import RichTextSection from '../RichTextSection';

const styles = theme => ({
  root: {
    maxWidth: '58.313rem'
  },
  title: {
    marginBottom: '1.375rem',
    padding: '0 0.75rem'
  },
  body: {
    padding: '0 1.188rem'
  },
  section: {
    marginTop: '2.5rem',
    paddingTop: '1rem',
    paddingBottom: '1rem',
    borderTop: `4px solid ${theme.palette.primary.main}`
  },
  social: {
    display: 'flex',
    flexDirection: 'row',
    alignItems: 'center',
    '&:not(:last-child)': {
      marginRight: '3.125rem'
    },
    '& > :first-child': {
      marginRight: '0.625rem'
    }
  },
  keyContacts: {
    '& > :not(:last-child)': {
      marginBottom: '2.5rem'
    }
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
        <div className={classes.keyContacts}>
          {keyContacts.map(keyContact => (
            <Grid container direction="column">
              <Typography>{keyContact.title}</Typography>
              <Link href={keyContact.link}>{keyContact.contact_details}</Link>
            </Grid>
          ))}
        </div>
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
        <Grid container direction="row">
          {socialMedia.map(social => (
            <Link className={classes.social} href={social.link}>
              <Icon className={social.icon} />
              {social.name}
            </Link>
          ))}
        </Grid>
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
