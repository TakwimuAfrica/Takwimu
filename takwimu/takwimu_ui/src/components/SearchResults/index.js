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

    const {
      takwimu: {
        page: { search }
      }
    } = props;
    this.state = { search };

    this.handleSearch = this.handleSearch.bind(this);
  }

  handleSearch(searchTerm) {
    const {
      takwimu: { page }
    } = this.props;
    fetch(`/api/search/?q=${searchTerm}&format=json`).then(response => {
      if (response.status === 200) {
        response.json().then(json => {
          Object.assign(page, json);
          const { search } = json;
          this.setState({ search });
        });
      }
    });
  }

  render() {
    const { classes } = this.props;
    const {
      search: { query, results }
    } = this.state;

    return (
      <Section classes={{ root: classes.root }}>
        <Typography variant="h3">Search Results</Typography>
        <SearchInput query={query} onRefresh={this.handleSearch} />
        <SearchResultsContainer results={results} />
      </Section>
    );
  }
}

SearchResults.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    page: PropTypes.shape({
      search: PropTypes.shape({
        query: PropTypes.string.isRequired,
        results: PropTypes.arrayOf(PropTypes.shape({})).isRequired
      }).isRequired
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(SearchResults);
