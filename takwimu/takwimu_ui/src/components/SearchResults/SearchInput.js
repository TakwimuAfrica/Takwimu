import React from 'react';
import { withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

const styles = theme => ({
  root: {
    marginTop: '1rem',
    marginBottom: '1rem'
  },
  searchInput: {
    width: '100%',
    backgroundColor: '#f6f6f6',
    borderStyle: 'None',
    padding: '0.75rem',
    color: theme.palette.data.main,
    fontSize: '1.5rem'
  }
});

function SearchInput({ classes }) {
  return (
    <div className={classes.root}>
      <input className={classes.searchInput} />
    </div>
  );
}

SearchInput.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(SearchInput);
