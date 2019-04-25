import React from 'react';
import { PropTypes } from 'prop-types';
import { withStyles, Input, InputLabel } from '@material-ui/core';
import SearchIcon from '@material-ui/icons/Search';
import InputAdornment from '@material-ui/core/InputAdornment';

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

function SearchInput({ classes, searchQuery }) {
  return (
    <div className={classes.root}>
      <InputLabel htmlFor="searchInput">{searchQuery}</InputLabel>
      <Input
        id="searchInput"
        className={classes.searchInput}
        endAdornment={
          <InputAdornment position="end">
            <SearchIcon />
          </InputAdornment>
        }
        placeHolder={searchQuery}
      />
    </div>
  );
}

SearchInput.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  searchQuery: PropTypes.string.isRequired
};

export default withStyles(styles)(SearchInput);
