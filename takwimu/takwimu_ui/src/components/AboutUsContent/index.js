import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography } from '@material-ui/core';

import AboutUsContentNav from './AboutUsContentNav';
import { About as AboutWhereToNext } from '../Next';
import ContentNavigation from './ContentNavigation';
import ContentSection from '../ContentSection';
import Faqs from '../Faqs';
import RelatedContent from '../RelatedContent';
import RichTextSection from '../RichTextSection';
import Services from '../Services';

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
    marginTop: '3rem',
    paddingTop: '3rem',
    paddingBottom: '1rem',
    borderTop: `4px solid ${theme.palette.primary.main}`
  }
});

function AboutContent({
  classes,
  content,
  methodology,
  relatedContent,
  current,
  contentHeadings,
  changeActiveContent,
  faqs,
  services,
  socialMedia
}) {
  return (
    <React.Fragment>
      <AboutUsContentNav
        current={current}
        contentHeadings={contentHeadings}
        changeActiveContent={changeActiveContent}
      />
      <Typography variant="h2" className={classes.title}>
        About
      </Typography>
      <ContentNavigation
        contentHeadings={contentHeadings}
        current={current}
        changeActiveContent={changeActiveContent}
      />
      <RichTextSection
        classes={{ root: classes.section }}
        title="About Takwimu"
        value={content}
        id="about"
        component={ContentSection}
      />
      <RichTextSection
        classes={{ root: classes.section }}
        title="Methodology"
        value={methodology}
        id="methodology"
        component={ContentSection}
      />
      <Services
        classes={{ root: classes.section }}
        services={services}
        id="services"
      />
      <Faqs classes={{ root: classes.section }} faqs={faqs} id="faqs" />
      <AboutWhereToNext socialMedia={socialMedia} />
      <RelatedContent relatedContent={relatedContent} />
    </React.Fragment>
  );
}

AboutContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.string.isRequired,
  methodology: PropTypes.string.isRequired,
  faqs: PropTypes.shape({}).isRequired,
  services: PropTypes.shape({}).isRequired,
  socialMedia: PropTypes.shape({}).isRequired,
  relatedContent: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  changeActiveContent: PropTypes.func.isRequired
};

export default withStyles(styles)(AboutContent);
