import React from 'react';
import { withStyles, Typography } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import AboutTakwimu from '../AboutTakwimu';
import Methodology from '../Methodology';
import Services from '../Services';
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
  borderDiv: {
    marginTop: '3rem',
    marginBottom: '3rem',
    borderStyle: 'solid',
    borderBottom: '4px',
    borderColor: theme.palette.primary.main
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
        <div className={classes.borderDiv} id="about" />
        <AboutTakwimu content={content} />
        <div className={classes.borderDiv} id="methodology" />
        <Methodology methodology={methodology} />
        <div className={classes.borderDiv} id="services" />
        <Services services={services} />
        <div className={classes.borderDiv} id="faqs" />
        <Faqs faqs={faqs} />
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
  relatedContent: PropTypes.shape([]).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.shape([]).isRequired,
  changeActiveContent: PropTypes.func.isRequired
};

export default withStyles(styles)(AboutContent);
