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

class SearchResults extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchQuery: '',
      searchResults: []
    };
  }

  componentDidMount() {
    const {
      search: { searchQuery }
    } = this.props;
    fetch(`/api/search/?q=${searchQuery}&format=json`).then(response => {
      if (response.status === 200) {
        response.json().then(json => {
          const { query, results: searchResults } = json;
          this.setState({ searchQuery: query, searchResults });
        });
      }
    });
  }

  render() {
    const { classes } = this.props;
    const { searchQuery, searchResults } = this.state;
    return (
      <Section classes={{ root: classes.root }}>
        <Typography variant="h3">Search Results</Typography>
        <SearchInput query={searchQuery} />
        <SearchResultsContainer results={searchResults} />
      </Section>
    );
  }
}

SearchResults.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  search: PropTypes.shape({
    searchQuery: PropTypes.string.isRequired
  }).isRequired
};

export default withStyles(styles)(SearchResults);
