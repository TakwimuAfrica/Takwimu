import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import { countrify } from '../core';
import AnalysisList from './AnalysisList';
import CurrentAnalysis from './CurrentAnalysis';
import Section from '../Section';

const styles = theme => ({
  root: {
    flexGrow: 1,
    backgroundColor: theme.palette.info.main
  },
  content: {
    paddingBottom: '1rem'
  },
  list: {
    height: '100%'
  }
});

class FeaturedAnalysis extends React.Component {
  constructor(props) {
    super(props);

    this.state = { current: 0 };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(index) {
    this.setState({ current: index });
  }

  render() {
    const {
      classes,
      takwimu: {
        countries,
        page: {
          featured_analysis: { value: featuredAnalysis }
        }
      }
    } = this.props;
    if (!featuredAnalysis) {
      return null;
    }

    const {
      title,
      featured_analyses: featuredAnalyses,
      read_analysis_link_label: readAnalysisTitle,
      view_profile_link_label: viewProfileTitle
    } = featuredAnalysis;
    const { current } = this.state;
    const countrifyTitle = analysis => {
      const { title: t, country } = analysis;
      return countrify(t, country, countries);
    };

    return (
      <Section title={title} variant="h2">
        <Grid
          container
          justify="flex-start"
          alignItems="stretch"
          className={classes.root}
        >
          {featuredAnalyses && featuredAnalyses.length > 0 && (
            <React.Fragment>
              <CurrentAnalysis
                countrifyTitle={countrifyTitle}
                content={featuredAnalyses[current]}
                classes={{ content: classes.content }}
                readAnalysisTitle={readAnalysisTitle}
                viewProfileTitle={viewProfileTitle}
              />
              <AnalysisList
                countrifyTitle={countrifyTitle}
                content={featuredAnalyses}
                current={current}
                onClick={this.handleClick}
                classes={{ content: classes.list }}
              />
            </React.Fragment>
          )}
        </Grid>
      </Section>
    );
  }
}

FeaturedAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    countries: PropTypes.arrayOf(PropTypes.shape({})).isRequired,
    page: PropTypes.shape({
      featured_analysis: PropTypes.shape({
        value: PropTypes.shape({
          title: PropTypes.string.isRequired,
          featured_analyses: PropTypes.arrayOf(
            PropTypes.shape({
              value: PropTypes.shape({
                title: PropTypes.string.isRequired,
                description: PropTypes.string.isRequired,
                slug: PropTypes.string.isRequired,
                country: PropTypes.shape({}).isRequired
              }).isRequired
            }).isRequired
          ).isRequired
        })
      }).isRequired
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(FeaturedAnalysis);
