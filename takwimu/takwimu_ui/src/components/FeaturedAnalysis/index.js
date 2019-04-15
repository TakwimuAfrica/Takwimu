import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import AnalysisList from './AnalysisList';
import CurrentAnalysis from './CurrentAnalysis';
import Section from '../Section';

const styles = () => ({
  root: {
    flexGrow: 1
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
      takwimu: { featured_analysis: featuredAnalysis }
    } = this.props;
    const { current } = this.state;

    return (
      <Section title="Featured Analysis" variant="h2">
        <Grid
          container
          justify="flex-start"
          alignItems="stretch"
          className={classes.root}
        >
          {featuredAnalysis && featuredAnalysis.length && (
            <React.Fragment>
              <CurrentAnalysis
                content={featuredAnalysis[current].value}
                classes={{ content: classes.content }}
              />
              <AnalysisList
                content={featuredAnalysis}
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
    featured_analysis: PropTypes.arrayOf(
      PropTypes.shape({
        value: PropTypes.shape({
          title: PropTypes.string.isRequired,
          description: PropTypes.string.isRequired,
          slug: PropTypes.string.isRequired,
          country_slug: PropTypes.string.isRequired,
          country_code: PropTypes.string.isRequired
        }).isRequired
      }).isRequired
    ).isRequired
  }).isRequired
};

export default withStyles(styles)(FeaturedAnalysis);
