import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import AnalysisList from './AnalysisList';
import CurrentAnalysis from './CurrentAnalysis';
import Section from '../Section';

import content from './content';

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

    this.state = { current: 1 };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(index) {
    this.setState({ current: index });
  }

  render() {
    const { classes } = this.props;
    const { current } = this.state;

    return (
      <Section title="Featured Analysis" variant="h2">
        <Grid
          container
          justify="flex-start"
          alignItems="stretch"
          className={classes.root}
        >
          <CurrentAnalysis
            content={content[current]}
            classes={{ content: classes.content }}
          />
          <AnalysisList
            content={content}
            current={current}
            onClick={this.handleClick}
            classes={{ content: classes.list }}
          />
        </Grid>
      </Section>
    );
  }
}

FeaturedAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(FeaturedAnalysis);
