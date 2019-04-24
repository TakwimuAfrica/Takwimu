import React from 'react';
import { PropTypes } from 'prop-types';
import { withStyles } from '@material-ui/core';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid';
import Link from '@material-ui/core/Link';
import SearchResultItem from './SearchResultItem';

const styles = theme => ({
  root: {},
  searchResultsList: {
    borderBottomStyle: 'solid',
    borderColor: theme.palette.primary.main,
    borderWidth: '3px',
    borderTopStyle: 'solid',
    paddingTop: '1.5rem',
    paddingBottom: '3rem',
    paddingLeft: '3rem',
    paddingRight: '3rem'
  },
  resultsFilter: {
    paddingTop: '2rem',
    paddingBottom: '2rem'
  },
  filterItem: {
    display: 'inline-block',
    marginRight: '1rem',
    color: theme.palette.primary.main,
    textDecoration: 'underline'
  },
  filterActive: {
    color: theme.palette.primary.main,
    textDecoration: 'none'
  },
  filterItemLabel: {
    display: 'inline-block',
    marginRight: '1rem'
  },
  paginationContainer: {
    padding: '3rem'
  },
  pagesList: {
    marginTop: '1rem'
  }
});

class SearchResultsContainer extends React.Component {
  constructor(props) {
    super(props);
    this.results = [
      {
        id: '23',
        resultType: 'Data by Topic',
        country: 'Uganda',
        title: 'All data',
        summary:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et tortor at risus viverra adipiscing.',
        link: 'https://takwimu.africa'
      },
      {
        id: '26',
        resultType: 'Analysis',
        country: 'Ethiopia',
        title: 'Politics',
        summary:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et tortor at risus viverra adipiscing.',
        link: 'https://takwimu.africa'
      },
      {
        id: '25',
        resultType: 'Data by Topic',
        country: 'Tanzania',
        title: 'Education',
        summary:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et tortor at risus viverra adipiscing.',
        link: 'https://takwimu.africa'
      },
      {
        id: '24',
        resultType: 'Analysis',
        country: 'Kenya',
        title: 'Health',
        summary:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et tortor at risus viverra adipiscing.',
        link: 'https://takwimu.africa'
      }
    ];
  }

  render() {
    const { classes } = this.props;
    const resultItems = this.results.map(result => (
      <SearchResultItem
        resultType={result.resultType}
        country={result.country}
        title={result.title}
        summary={result.summary}
        key={result.id}
      />
    ));

    const paginator = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(page => (
      <Link className={classes.filterItem} href="/search">
        {page}
      </Link>
    ));

    return (
      <div className={classes.root}>
        <div className={classes.resultsFilter}>
          <Grid container spacing={24} justify="space-between">
            <Grid item xs={6}>
              <Typography variant="body2">
                Showing Results 1 - 10 of 100 results
              </Typography>
            </Grid>
            <Grid item xs={6}>
              <Typography
                variant="body2"
                color="inherit"
                className={classes.filterItemLabel}
              >
                Show:
              </Typography>
              <Link className={classes.filterItem} href="/search">
                All Results
              </Link>
              <Link className={classes.filterItem} href="/search">
                Analysis Results
              </Link>
              <Link className={classes.filterItem} href="/search">
                Data Results
              </Link>
            </Grid>
          </Grid>
        </div>
        <div className={classes.searchResultsList}>{resultItems}</div>

        <div className={classes.paginationContainer}>
          <Typography variant="body2">
            Showing Results 1 - 10 of 100 results
          </Typography>
          <div className={classes.pagesList}>{paginator}</div>
        </div>
      </div>
    );
  }
}

SearchResultsContainer.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(SearchResultsContainer);
