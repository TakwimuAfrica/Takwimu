import React from 'react';
import { PropTypes } from 'prop-types';
import { withStyles, Input } from '@material-ui/core';
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
    paddingBottom: '1.5rem',
    paddingTop: '1.5rem',
    paddingLeft: '2.0625rem',
    paddingRight: '2.4375rem',
    color: theme.palette.data.main,
    fontSize: theme.typography.h3.fontSize
  },
  iconStyle: {
    color: theme.palette.text.primary
  }
});

function SearchInput({ classes, query }) {
  return (
    <div className={classes.root}>
      <Input
        id="searchInput"
        classes={{ root: classes.searchInput }}
        disableUnderline
        placeholder={query}
        endAdornment={
          <InputAdornment position="end">
            <SearchIcon
              fontSize="inherit"
              color="primary"
              classes={{ colorPrimary: classes.iconStyle }}
            />
          </InputAdornment>
        }
      />
    </div>
  );
}

SearchInput.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  query: PropTypes.string.isRequired
};

export default withStyles(styles)(SearchInput);
