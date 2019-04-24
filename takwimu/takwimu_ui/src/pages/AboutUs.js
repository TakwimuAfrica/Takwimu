import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import AboutUsContent from '../components/AboutUsContent/index';
import ContentPage from '../components/ContentPage';
import SideMenu from '../components/AboutUsContent/SideMenu';

const styles = () => ({
  root: {
    marginTop: '3.875rem',
    marginBottom: '4.375rem'
  }
});

const contentHeadings = [
  { title: 'About Takwimu', link: 'about' },
  { title: 'Methodology', link: 'methodology' },
  { title: 'Services', link: 'services' },
  { title: 'FAQs', link: 'faqs' }
];

class AboutUsPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = { current: 0 };

    this.changeActiveContent = this.changeActiveContent.bind(this);
  }

  changeActiveContent(index) {
    this.setState({
      current: index
    });
    const activeElement = document.getElementById(contentHeadings[index].link);
    window.scrollTo(0, activeElement.offsetTop - 90);
  }

  render() {
    const {
      classes,
      takwimu: {
        content,
        methodology,
        relatedContent,
        faqs,
        services,
        settings: { socialMedia }
      }
    } = this.props;
    const { current } = this.state;
    return (
      <ContentPage
        aside={
          <SideMenu
            current={current}
            contentHeadings={contentHeadings}
            changeActiveContent={this.changeActiveContent}
          />
        }
        classes={{ root: classes.root }}
      >
        <AboutUsContent
          content={content}
          methodology={methodology}
          relatedContent={relatedContent}
          faqs={faqs}
          services={services}
          socialMedia={socialMedia}
          current={current}
          contentHeadings={contentHeadings}
          changeActiveContent={this.changeActiveContent}
        />
      </ContentPage>
    );
  }
}

AboutUsPage.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    content: PropTypes.string.isRequired,
    methodology: PropTypes.string.isRequired,
    faqs: PropTypes.shape({}).isRequired,
    services: PropTypes.shape({}).isRequired,
    settings: PropTypes.shape({
      socialMedia: PropTypes.shape({}).isRequired
    }).isRequired,
    relatedContent: PropTypes.shape([]).isRequired
  }).isRequired
};

export default withStyles(styles)(AboutUsPage);
