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
    marginBottom: '1.375rem',
    padding: '0 0.75rem'
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

class AboutContent extends React.Component {
  constructor(props) {
    super(props);

    this.showContent = this.showContent.bind(this);
  }

  showContent(currentContent) {
    const { changeActiveContent } = this.props;
    return () => {
      changeActiveContent(currentContent);
    };
  }

  render() {
    const {
      classes,
      title,
      contentNavigation,
      aboutTakwimu,
      methodology,
      relatedContent,
      current,
      contentHeadings,
      faqs,
      services,
      socialMedia
    } = this.props;

    return (
      <React.Fragment>
        <AboutUsContentNav
          title={contentNavigation.value.title}
          current={current}
          contentHeadings={contentHeadings}
          changeActiveContent={this.showContent}
        />
        <Typography variant="h2" className={classes.title}>
          {title}
        </Typography>
        <ContentNavigation
          title={contentNavigation.value.title}
          contentHeadings={contentHeadings}
          current={current}
          changeActiveContent={this.showContent}
        />
        {aboutTakwimu && aboutTakwimu.value && (
          <RichTextSection
            classes={{ root: classes.section }}
            title={aboutTakwimu.value.title}
            value={aboutTakwimu.value.description}
            id="about"
            component={ContentSection}
          />
        )}
        {methodology && methodology.value && (
          <RichTextSection
            classes={{ root: classes.section }}
            title={methodology.value.title}
            value={methodology.value.description}
            id="methodology"
            component={ContentSection}
          />
        )}
        <Services
          classes={{ root: classes.section }}
          services={services}
          id="services"
        />
        <Faqs classes={{ root: classes.section }} faqs={faqs} id="faqs" />
        <AboutWhereToNext socialMedia={socialMedia} />
        <RelatedContent content={relatedContent} />
      </React.Fragment>
    );
  }
}

AboutContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string.isRequired,
  contentNavigation: PropTypes.shape({
    value: PropTypes.shape({
      title: PropTypes.string
    })
  }).isRequired,
  aboutTakwimu: PropTypes.shape({
    value: PropTypes.shape({
      title: PropTypes.string,
      description: PropTypes.string
    })
  }).isRequired,
  methodology: PropTypes.shape({
    value: PropTypes.shape({
      title: PropTypes.string,
      description: PropTypes.string
    })
  }).isRequired,
  faqs: PropTypes.shape({}).isRequired,
  services: PropTypes.shape({}).isRequired,
  socialMedia: PropTypes.shape({}).isRequired,
  relatedContent: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  changeActiveContent: PropTypes.func.isRequired
};

export default withStyles(styles)(AboutContent);
