import React from 'react';
import { withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import AboutTakwimu from '../AboutTakwimu';
import Methodology from '../Methodology';
import Services from '../Services';
import RelatedContent from '../RelatedContent';
import AboutContentNav from './AboutContentNav';
import { About as AboutWhereToNext } from '../Next';
import Faqs from '../Faqs';

const styles = {
  root: {
    maxWidth: '933px'
  },
  title: {
    margin: '37px 0 22px 19px'
  },
  body: {
    padding: '0 19px'
  }
};

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
        <AboutTakwimu content={content} />
        <Methodology methodology={methodology} />
        <Services services={services} />
        <Faqs faqs={faqs} />
        <AboutWhereToNext socialMedia={socialMedia} />
        <RelatedContent relatedContent={relatedContent} />
      </React.Fragment>
    );
  }
}

AboutContent.propTypes = {
  content: PropTypes.string.isRequired,
  methodology: PropTypes.string.isRequired,
  faqs: PropTypes.shape({}).isRequired,
  services: PropTypes.shape({}).isRequired,
  socialMedia: PropTypes.shape({}).isRequired,
  relatedContent: PropTypes.shape([]).isRequired
};

export default withStyles(styles)(AboutContent);
