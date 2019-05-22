import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography, Grid, Link, Icon } from '@material-ui/core';

import ContactContentNav from './ContactContentNav';
import ContentSection from '../ContentSection';
import RichTextSection from '../RichTextSection';
import { Contact as ContactWhereToNext } from '../Next';
import RelatedContent from '../RelatedContent';

import facebook from '../../assets/images/logo-facebook.svg';
import github from '../../assets/images/logo-github.svg';
import instagram from '../../assets/images/group-3.svg';
import linkedin from '../../assets/images/group-3-copy.svg';
import medium from '../../assets/images/logo-medium.svg';
import twitter from '../../assets/images/logo-twitter.svg';

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
  },
  whereToNext: {
    marginTop: '7.75rem'
  }
});

const SOCIAL_MEDIA = {
  facebook: { name: 'Facebook', logo: facebook },
  github: { name: 'GitHub', logo: github },
  instagram: { name: 'Instagram', logo: instagram },
  linkedin: { name: 'LinkedIn', logo: linkedin },
  medium: { name: 'Medium', logo: medium },
  twitter: { name: 'Twitter', logo: twitter }
};

function ContactContent({
  classes,
  title,
  address: { value: address },
  addressIndex,
  keyContacts: { value: keyContacts },
  keyContactsIndex,
  socialMedia: { value: socialMedia },
  socialMediaIndex,
  current,
  contentHeadings,
  changeActiveContent,
  settingsSocialMedia,
  relatedContent,
  settings: { socialMedia: socialMediaSettings }
}) {
  return (
    <React.Fragment>
      <ContactContentNav
        title={contentHeadings[0].title}
        current={current}
        contentHeadings={contentHeadings}
        changeActiveContent={changeActiveContent}
      />
      <Typography variant="h2" className={classes.title}>
        {title}
      </Typography>
      {keyContacts && (
        <ContentSection
          id={contentHeadings[keyContactsIndex].link}
          classes={{ root: classes.section }}
          title={keyContacts.title}
          variant="h3"
        >
          <div className={classes.keyContacts}>
            {keyContacts.contacts.map(keyContact => (
              <Grid container direction="column">
                <Typography>{keyContact.title}</Typography>
                <Link href={keyContact.link}>{keyContact.contact_details}</Link>
              </Grid>
            ))}
          </div>
        </ContentSection>
      )}
      {address && (
        <RichTextSection
          id={contentHeadings[addressIndex].link}
          classes={{ root: classes.section }}
          title={address.title}
          value={address.description}
          component={ContentSection}
        />
      )}
      {socialMedia && (
        <ContentSection
          id={contentHeadings[socialMediaIndex].link}
          classes={{ root: classes.section }}
          title={socialMedia.title}
          variant="h3"
        >
          <Grid container direction="row">
            {socialMedia.accounts.map(account => (
              <Link
                className={classes.social}
                href={socialMediaSettings[account.name]}
              >
                <img
                  src={SOCIAL_MEDIA[account.name].logo}
                  alt=""
                  className={classes.icon}
                />
                <Icon className={classes.social} />
                {SOCIAL_MEDIA[account.name].name}
              </Link>
            ))}
          </Grid>
        </ContentSection>
      )}
      <ContactWhereToNext
        classes={{ sectionRoot: classes.whereToNext }}
        socialMedia={settingsSocialMedia}
      />
      <RelatedContent content={relatedContent} />
    </React.Fragment>
  );
}

ContactContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string.isRequired,
  address: PropTypes.shape({
    value: PropTypes.shape({})
  }).isRequired,
  addressIndex: PropTypes.number.isRequired,
  keyContacts: PropTypes.shape({
    value: PropTypes.shape({})
  }).isRequired,
  keyContactsIndex: PropTypes.number.isRequired,
  socialMedia: PropTypes.shape({
    value: PropTypes.shape({})
  }).isRequired,
  socialMediaIndex: PropTypes.number.isRequired,
  settingsSocialMedia: PropTypes.shape({}).isRequired,
  relatedContent: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  changeActiveContent: PropTypes.func.isRequired,
  settings: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(ContactContent);
