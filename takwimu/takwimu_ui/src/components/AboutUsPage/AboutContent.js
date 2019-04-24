import React from 'react';
import { withStyles, Typography } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import AboutTakwimu from '../AboutTakwimu';
import Methodology from '../Methodology';
import Services from '../Services';
import RelatedContent from '../RelatedContent';
import AboutContentNav from './AboutContentNav';
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

const contentHeadings = [
  { title: 'About Takwimu', link: 'about' },
  { title: 'Methodology', link: 'methodology' },
  { title: 'Services', link: 'services' },
  { title: 'FAQs', link: 'faqs' }
];

class AboutContent extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      activeContent: 'about'
    };
    this.showContent = this.showContent.bind(this);
  }

  showContent(currentContent) {
    return () => {
      this.setState({ activeContent: currentContent });
      window.scrollTo(0, 0);
    };
  }

  render() {
    const {
      classes,
      content,
      methodology,
      relatedContent,
      faqs,
      services,
      socialMedia
    } = this.props;
    const { activeContent } = this.state;
    return (
      <React.Fragment>
        <AboutContentNav
          currentContent={activeContent}
          contentHeadings={contentHeadings}
          showContent={this.showContent}
        />
        <Typography variant="h2" className={classes.title}>
          About Us
        </Typography>
        <PageNav
          contentHeadings={contentHeadings}
          currentContent={activeContent}
        />
        <div className={classes.borderDiv} />
        <AboutTakwimu content={content} />
        <div className={classes.borderDiv} />
        <Methodology methodology={methodology} />
        <div className={classes.borderDiv} />
        <Services services={services} />
        <div className={classes.borderDiv} />
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
  relatedContent: PropTypes.shape([]).isRequired
};

export default withStyles(styles)(AboutContent);
