import React from 'react';
import { withStyles, Typography } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import RichTextSection from '../RichTextSection';
import Services from '../Services';
import ContentSection from '../ContentSection';
import RelatedContent from '../RelatedContent';
import AboutUsContentNav from './AboutUsContentNav';
import { About as AboutWhereToNext } from '../Next';
import Faqs from '../Faqs';
import PageNav from './PageNav';

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
    padidngTop: '3rem',
    padidngBottom: '1rem',
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
      content,
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
          current={current}
          contentHeadings={contentHeadings}
          changeActiveContent={this.showContent}
        />
        <Typography variant="h2" className={classes.title}>
          About Us
        </Typography>
        <PageNav
          contentHeadings={contentHeadings}
          current={current}
          changeActiveContent={this.showContent}
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
