import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import AboutUsContent from '../components/AboutUsContent/index';
import ContentPage from '../components/ContentPage';
import TableOfContent from '../components/AboutUsContent/TableOfContent';

const styles = () => ({
  root: {
    marginTop: '2.875rem',
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

  componentDidMount() {
    const {
      takwimu: { page }
    } = this.props;
    const { activeContent } = page;
    const currentIndex = contentHeadings.findIndex(
      x => x.link === activeContent
    );

    if (currentIndex !== -1) {
      this.changeActiveContent(currentIndex);
    }
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
        related_content: relatedContent,
        faqs,
        services,
        settings: { socialMedia }
      }
    } = this.props;
    const { current } = this.state;
    return (
      <ContentPage
        aside={
          <TableOfContent
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
    page: PropTypes.shape({}).isRequired,
    content: PropTypes.string.isRequired,
    methodology: PropTypes.string.isRequired,
    faqs: PropTypes.shape({}).isRequired,
    services: PropTypes.shape({}).isRequired,
    settings: PropTypes.shape({
      socialMedia: PropTypes.shape({}).isRequired
    }).isRequired,
    related_content: PropTypes.arrayOf(PropTypes.shape({}).isRequired)
      .isRequired
  }).isRequired
};

export default withStyles(styles)(AboutUsPage);
