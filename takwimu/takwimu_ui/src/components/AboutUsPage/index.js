import React from 'react';
import { withStyles, Grid } from '@material-ui/core';

import PropTypes from 'prop-types';

import Section from '../Section';
import SideMenu from './SideMenu';
import AboutContent from './AboutContent';

const styles = theme => ({
  root: {
    marginTop: '3.8755rem',
    marginBottom: '6.6875rem'
  },
  title: {
    margin: '37px 0 22px 19px'
  },
  body: {
    padding: '0 19px'
  },
  aside: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '10.5rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '14rem'
    }
  },
  main: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '44.671875rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '59.5625rem'
    }
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
    this.state = { activeContent: 'about' };

    this.changeActiveContent = this.changeActiveContent.bind(this);
  }

  changeActiveContent(content) {
    this.setState({
      activeContent: content
    });
    window.scrollTo(0, 0);
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
    const { activeContent } = this.state;
    return (
      <Section classes={{ root: classes.root }}>
        <Grid container justify="space-between">
          <div className={classes.aside}>
            <SideMenu
              activeContent={activeContent}
              contentHeadings={contentHeadings}
              changeActiveContent={this.changeActiveContent}
            />
          </div>
          <div className={classes.main}>
            <AboutContent
              content={content}
              methodology={methodology}
              relatedContent={relatedContent}
              faqs={faqs}
              services={services}
              socialMedia={socialMedia}
              activeContent={activeContent}
              contentHeadings={contentHeadings}
              changeActiveContent={this.changeActiveContent}
            />
          </div>
        </Grid>
      </Section>
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
