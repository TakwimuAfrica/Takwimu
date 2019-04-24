import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import { Typography } from '@material-ui/core';
import { PropTypes } from 'prop-types';
import SearchInput from './SearchInput';
import SearchResultsContainer from './SearchResultsContainer';

const styles = () => ({
  root: {
    padding: '3rem'
  }
});

function SearchResults({ classes }) {
  return (
    <div className={classes.root}>
      <Typography variant="h3">Search Results</Typography>
      <SearchInput />
      <SearchResultsContainer />
    </div>
  );
}

SearchResults.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(SearchResults);
