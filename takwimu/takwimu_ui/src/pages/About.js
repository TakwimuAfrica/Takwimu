import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import AboutContent from '../components/AboutContent/index';
import ContentPage from '../components/ContentPage';
import TableOfContent from '../components/AboutContent/TableOfContent';

const styles = () => ({
  root: {
    marginTop: '2.875rem',
    marginBottom: '4.375rem'
  }
});

class About extends React.Component {
  constructor(props) {
    super(props);
    this.state = { current: 0 };

    this.getContentHeadings = this.getContentHeadings.bind(this);
    this.changeActiveContent = this.changeActiveContent.bind(this);
  }

  componentDidMount() {
    const {
      takwimu: { page }
    } = this.props;
    const { active_content: activeContent } = page;
    const contentHeadings = this.getContentHeadings();
    const foundIndex = contentHeadings.findIndex(x => x.link === activeContent);

    if (foundIndex !== -1) {
      this.changeActiveContent(foundIndex);
    }
    this.setState({ current: foundIndex });
  }

  getContentHeadings() {
    const {
      takwimu: {
        page: { about_takwimu: aboutTakwimu, methodology, faqs, services }
      }
    } = this.props;
    const contentHeadings = [];
    if (aboutTakwimu && aboutTakwimu.value) {
      contentHeadings.push({
        title: aboutTakwimu.value.label,
        link: 'about'
      });
    }
    if (methodology && methodology.value) {
      contentHeadings.push({
        title: methodology.value.label,
        link: 'methodology'
      });
    }
    if (services && services.value) {
      contentHeadings.push({ title: services.value.label, link: 'services' });
    }
    if (faqs && faqs.value) {
      contentHeadings.push({ title: faqs.value.label, link: 'faqs' });
    }
    return contentHeadings;
  }

  changeActiveContent(index) {
    this.setState({
      current: index
    });
    const contentHeadings = this.getContentHeadings();
    const activeElement = document.getElementById(contentHeadings[index].link);
    window.scrollTo(0, activeElement.offsetTop - 90);
  }

  render() {
    const {
      classes,
      takwimu: {
        page: {
          title,
          content_navigation: contentNavigation,
          about_takwimu: aboutTakwimu,
          methodology,
          related_content: relatedContent,
          faqs,
          services
        },
        settings: { socialMedia }
      }
    } = this.props;
    const { current } = this.state;
    const contentHeadings = this.getContentHeadings();

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
        <AboutContent
          title={title}
          contentNavigation={contentNavigation}
          aboutTakwimu={aboutTakwimu}
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

About.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    page: PropTypes.shape({
      title: PropTypes.string.isRequired,
      active_content: PropTypes.string,
      content_navigation: PropTypes.shape({
        value: PropTypes.shape({
          title: PropTypes.string.isRequired
        }).isRequired
      }).isRequired,
      about_takwimu: PropTypes.shape({
        value: PropTypes.shape({
          label: PropTypes.string
        })
      }),
      faqs: PropTypes.shape({}),
      methodology: PropTypes.shape({}),
      related_content: PropTypes.shape({}),
      services: PropTypes.shape({})
    }).isRequired,
    settings: PropTypes.shape({
      socialMedia: PropTypes.shape({}).isRequired
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(About);
