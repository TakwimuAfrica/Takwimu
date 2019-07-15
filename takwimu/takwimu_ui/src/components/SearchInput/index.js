import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core/styles';
import { Typography } from '@material-ui/core';

import Input from './Input';

const styles = () => ({
  root: {
    marginTop: '3.875rem',
    marginBottom: '4.75rem'
  },
  title: {}
});

function SearchInput({ classes, onRefresh, query, title }) {
  return (
    <div className={classes.root}>
      <Typography variant="h3" className={classes.title}>
        {title}
      </Typography>
      <Input query={query} onRefresh={onRefresh} />
    </div>
  );
}

SearchInput.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  onRefresh: PropTypes.func,
  query: PropTypes.string.isRequired,
  title: PropTypes.string
};

SearchInput.defaultProps = {
  onRefresh: null,
  title: 'Search Results'
};

export default withStyles(styles)(SearchInput);
