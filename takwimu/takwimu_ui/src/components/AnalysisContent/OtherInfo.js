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
  otherTopicSelected: {},
  label: {
    color: '#848484',
    fontSize: '0.813rem',
    marginBottom: '1rem'
  }
});

function OtherTopics({
  classes,
  labelText,
  labelTextStrong,
  current,
  content,
  showContent
}) {
  return (
    <div className={classes.root}>
      <Typography className={classes.label}>
        {labelText} <strong>{labelTextStrong}</strong>
      </Typography>
      <div className={classes.otherTopicLinks}>
        {content.body.map((c, index) => (
          <Link
            key={c.id}
            href={c.id}
            component="button"
            variant="body2"
            color={current === index ? 'textPrimary' : 'primary'}
            className={classNames({
              [classes.otherTopic]: current !== index
            })}
            onClick={showContent(index)}
          >
            {c.value.title}
          </Link>
        ))}
      </div>
    </div>
  );
}

OtherTopics.propTypes = {
  labelText: PropTypes.string.isRequired,
  labelTextStrong: PropTypes.string.isRequired,
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  content: PropTypes.shape({}).isRequired,
  showContent: PropTypes.func.isRequired
};

export default withStyles(styles)(OtherTopics);
