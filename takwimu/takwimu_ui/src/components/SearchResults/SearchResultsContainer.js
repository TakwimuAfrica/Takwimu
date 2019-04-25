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
    paddingTop: '1.5rem',
    paddingBottom: '3rem',
    marginLeft: '2.0625rem',
    marginRight: '4.3125rem'
  },
  resultsFilter: {
    paddingTop: '2rem',
    paddingBottom: '2rem',
    marginLeft: '2.0625rem',
    display: 'flex'
  },
  filter: {
    alignItems: 'center',
    justifyContent: 'flex-end',
    display: 'flex',
    width: '70%'
  },
  showResult: {
    width: '30%'
  },
  filterItem: {
    display: 'inline-block',
    marginLeft: '1rem',
    color: theme.palette.primary.main,
    textDecoration: 'underline'
  },
  filterActive: {
    color: theme.palette.primary.main,
    textDecoration: 'none'
  },
  filterItemLabel: {
    display: 'inline-block'
  },
  paginationContainer: {
    padding: '3rem'
  },
  borderDiv: {
    borderStyle: 'solid',
    borderBottom: '4px',
    borderColor: theme.palette.primary.main
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
    const {
      classes,
      results: { items }
    } = this.props;
    const resultItems = items.map(result => (
      <SearchResultItem
        resultType="Analysis"
        country={result.country}
        link={result.url}
        title={result.dataPoint.title}
        summary={result.dataPoint.summary}
        key={result.id}
      />
    ));

    const paginator = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map(page => (
      <Link className={classes.filterItem} href="/search">
        {page}
      </Link>
    ));

    let resultIndex = '';
    if (items.length > 10) {
      resultIndex = 'Results 1 - 10 of ';
    }
    return (
      <div className={classes.root}>
        <Grid className={classes.resultsFilter}>
          <Typography item variant="body2" className={classes.showResult}>
            {`Showing ${resultIndex}${items.length} results`}
          </Typography>
          <Grid item className={classes.filter}>
            <Typography
              item
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
        <div className={classes.borderDiv} />
        <div className={classes.searchResultsList}>{resultItems}</div>
        <div className={classes.borderDiv} />

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
  classes: PropTypes.shape({}).isRequired,
  results: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(SearchResultsContainer);
