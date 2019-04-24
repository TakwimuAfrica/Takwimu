import React from 'react';

import { Link, Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import classNames from 'classnames';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.info.main,
    padding: '1.125rem 1.625rem'
  },
  otherTopicLinks: {
    '& > button:nth-child(n)': {
      marginRight: '3.125rem'
    }
  },
  otherTopic: {
    color: theme.palette.primary.main,
    textDecoration: 'underline'
  },
  label: {
    color: '#848484',
    fontSize: '0.813rem',
    marginBottom: '1rem'
  }
});

function PageNav({ classes, current, contentHeadings, changeActiveContent }) {
  return (
    <div className={classes.root}>
      <Typography className={classes.label}>On this page</Typography>
      <div className={classes.otherTopicLinks}>
        {contentHeadings.map((c, index) => (
          <Link
            key={c.link}
            href={c.link}
            component="button"
            variant="body2"
            color={current === index ? 'textPrimary' : 'primary'}
            onClick={changeActiveContent(index)}
            className={classNames({
              [classes.otherTopic]: current !== index
            })}
          >
            {c.title}
          </Link>
        ))}
      </div>
    </div>
  );
}

PageNav.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.shape({}).isRequired,
  changeActiveContent: PropTypes.func.isRequired
};

export default withStyles(styles)(PageNav);
