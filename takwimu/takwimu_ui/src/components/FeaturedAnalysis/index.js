import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import AnalysisList from './AnalysisList';
import CurrentAnalysis from './CurrentAnalysis';
import Section from '../Section';

// import content from './content';

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

    this.state = {
      current: 0,
      analysis: []
    };
    this.handleClick = this.handleClick.bind(this);
  }

  componentDidMount() {
    fetch(
      `${
        process.env.REACT_APP_TAKWIMU_WAGTAIL_API_URL
      }/pages/?type=takwimu.IndexPage&fields=analysis&format=json`
    )
      .then(response => response.json())
      .then(json => this.setState({ analysis: json.items[0].analysis }));
  }

  handleClick(index) {
    this.setState({ current: index });
  }

  render() {
    const { classes } = this.props;
    const { current, analysis } = this.state;

    console.log(analysis);

    const contents = analysis.map(a => ({
      title: a.value.featured_page.title,
      description: a.value.featured_page.description
    }));
    console.log(contents);

    return (
      <Section title="Featured Analysis" variant="h2">
        {contents.length && (
          <Grid
            container
            justify="flex-start"
            alignItems="stretch"
            className={classes.root}
          >
            {console.log('here')}
            <CurrentAnalysis
              content={contents[current]}
              classes={{ content: classes.content }}
            />
            <AnalysisList
              content={contents}
              current={current}
              onClick={this.handleClick}
              classes={{ content: classes.list }}
            />
          </Grid>
        )}
      </Section>
    );
  }
}

FeaturedAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(FeaturedAnalysis);
