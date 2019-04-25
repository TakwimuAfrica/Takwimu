import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import { Typography } from '@material-ui/core';
import { PropTypes } from 'prop-types';
import SearchInput from './SearchInput';
import SearchResultsContainer from './SearchResultsContainer';
import Section from '../Section';

const styles = () => ({
  root: {
    marginTop: '3.875rem',
    marginBottom: '4.75rem'
  }
});

function SearchResults({ classes, takwimu: { search } }) {
  const { searchQuery, searchResults } = search;
  return (
    <Section classes={{ root: classes.root }}>
      <Typography variant="h3">Search Results</Typography>
      <SearchInput searchQuery={searchQuery} />
      <SearchResultsContainer searchResults={searchResults} />
    </Section>
  );
}

SearchResults.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    search: PropTypes.shape({}).isRequired
  }).isRequired
};

export default withStyles(styles)(SearchResults);
