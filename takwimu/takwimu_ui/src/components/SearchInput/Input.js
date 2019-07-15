import React from 'react';
import { PropTypes } from 'prop-types';
import { withStyles, InputBase, IconButton } from '@material-ui/core';
import SearchIcon from '@material-ui/icons/Search';
import InputAdornment from '@material-ui/core/InputAdornment';

const styles = theme => ({
  root: {
    marginTop: '1rem',
    marginBottom: '1rem'
  },
  searchInput: {
    width: '100%',
    backgroundColor: theme.palette.background.light,
    borderStyle: 'None',
    paddingBottom: '1.5rem',
    paddingTop: '1.5rem',
    paddingLeft: '2.0625rem',
    paddingRight: '2.4375rem',
    color: theme.palette.data.main,
    fontSize: theme.typography.h3.fontSize
  },
  searchInputButton: {
    padding: 0,
    fontSize: '2.3125rem'
  },
  iconStyle: {
    color: theme.palette.text.primary
  }
});

class Input extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ''
    };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState({ searchTerm: event.target.value });
  }

  render() {
    const { classes, onRefresh, placeholder, query } = this.props;
    const { searchTerm } = this.state;

    const handleSearchClick = () => {
      if (query !== searchTerm && searchTerm.length > 0) {
        // On the search page, onRefresh will be a function used to query the
        // API. On all other pages that this component is used, onRefresh is
        // expected to be null
        if (typeof onRefresh === 'function') {
          window.history.pushState(null, '', `/search/?q=${searchTerm}`);
          onRefresh(searchTerm);
        } else {
          window.location = `/search/?q=${searchTerm}`;
        }
      }
    };

    return (
      <div className={classes.root}>
        <InputBase
          id="searchInput"
          classes={{ root: classes.searchInput }}
          defaultValue={searchTerm || query}
          onChange={this.handleChange}
          onKeyPress={e => {
            if (e.key === 'Enter') {
              handleSearchClick(e);
            }
          }}
          placeholder={placeholder}
          endAdornment={
            <InputAdornment position="end">
              <IconButton
                classes={{ root: classes.searchInputButton }}
                onClick={e => {
                  handleSearchClick(e);
                }}
              >
                <SearchIcon
                  fontSize="inherit"
                  color="primary"
                  classes={{ colorPrimary: classes.iconStyle }}
                />
              </IconButton>
            </InputAdornment>
          }
        />
      </div>
    );
  }
}

Input.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  onRefresh: PropTypes.func.isRequired,
  placeholder: PropTypes.string,
  query: PropTypes.string.isRequired
};

Input.defaultProps = {
  placeholder: 'Enter search term'
};

export default withStyles(styles)(Input);
