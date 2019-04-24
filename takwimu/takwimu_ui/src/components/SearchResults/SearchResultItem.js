import React from 'react';
import { withStyles, Typography } from '@material-ui/core';
import { PropTypes } from 'prop-types';

const styles = theme => ({
  root: {
    marginTop: '1.5rem'
  },
  searchResult: {},
  link: {
    color: theme.palette.primary.main,
    textDecoration: 'underline'
  },
  searchResultItem: {
    color: theme.palette.primary.main,
    fontWeight: 'bold'
  },
  resultType: {
    fontWeight: 'bold'
  }
});

function SearchResultItem({
  classes,
  country,
  title,
  link,
  summary,
  resultType
}) {
  return (
    <div className={classes.root}>
      <Typography variant="body1" className={classes.resultType}>
        {resultType}
      </Typography>
      <a href={link} className={classes.link}>
        <Typography variant="body1" className={classes.searchResultItem}>
          {country} - {title}
        </Typography>
      </a>
      <Typography variant="body2">{summary}</Typography>
    </div>
  );
}

SearchResultItem.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  country: PropTypes.string.isRequired,
  link: PropTypes.string.isRequired,
  resultType: PropTypes.string.isRequired,
  summary: PropTypes.string.isRequired,
  title: PropTypes.string.isRequired
};

export default withStyles(styles)(SearchResultItem);
