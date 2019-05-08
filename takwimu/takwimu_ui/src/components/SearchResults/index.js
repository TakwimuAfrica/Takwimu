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
      searchResults: []
    };

    this.handleSearch = this.handleSearch.bind(this);
  }

  componentDidMount() {
    const {
      search: { searchQuery }
    } = this.props;
    this.handleSearch(searchQuery);
  }

  handleSearch(searchTerm) {
    fetch(`/api/search/?q=${searchTerm}&format=json`).then(response => {
      if (response.status === 200) {
        response.json().then(json => {
          this.setState({ searchResults: json });
        });
      }
    });
  }

  render() {
    const {
      classes,
      search: { searchQuery }
    } = this.props;
    const { searchResults } = this.state;

    return (
      <Section classes={{ root: classes.root }}>
        <Typography variant="h3">Search Results</Typography>
        <SearchInput query={searchQuery} onRefresh={this.handleSearch} />
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
