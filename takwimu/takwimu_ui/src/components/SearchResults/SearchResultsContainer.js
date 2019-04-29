import React from 'react';
import { PropTypes } from 'prop-types';
import { withStyles } from '@material-ui/core';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid';
import Link from '@material-ui/core/Link';
import classNames from 'classnames';
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
    textDecoration: 'underline'
  },
  filterActive: {
    color: theme.palette.text.primary,
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

function RenderPaginator({ classes, items, activePage }) {
  const numPages = Math.floor(items / 10) + 1;
  console.log(numPages);
  const pages = Array.from({ length: numPages }, (v, k) => k + 1);

  return (
    <div className={classes.pagesList}>
      {activePage > 1 ? (
        <Link className={classes.filterItem} href="/search">
          Previous
        </Link>
      ) : null}
      {pages.map(page => (
        <Link
          className={classNames([
            classes.filterItem,
            { [classes.filterActive]: page === activePage }
          ])}
          href="/search"
        >
          {page}
        </Link>
      ))}
      <Link className={classes.filterItem} href="/search">
        Next
      </Link>
    </div>
  );
}
RenderPaginator.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  items: PropTypes.number.isRequired,
  activePage: PropTypes.number.isRequired
};
export const Paginator = withStyles(styles)(RenderPaginator);

function SearchResultsContainer({ classes, results: { items } }) {
  const resultItems = items.map(result => (
    <SearchResultItem
      resultType="Analysis"
      country={result.country}
      link={result.url}
      title={result.title}
      summary={result.summary}
      key={result.id}
    />
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
          {`Showing ${resultIndex}${items.length} results`}
        </Typography>
        <Paginator items={items.length} activePage={1} />
      </div>
    </div>
  );
}

SearchResultsContainer.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  results: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(SearchResultsContainer);
