import React from 'react';

import { Typography, ButtonBase, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import classNames from 'classnames';

import Layout from '../Layout';

const styles = theme => ({
  root: {
    position: 'fixed',
    top: 0,
    left: 0,
    width: '100%',
    height: '100px',
    display: 'flex',
    justifyContent: 'center',
    zIndex: 1,
    backgroundColor: theme.palette.primary.main
  },
  otherTopicLinks: {
    '& > button:nth-child(n)': {
      marginRight: '3.125rem'
    }
  },
  otherTopic: {
    color: 'white',
    textDecoration: 'underline'
  },
  label: {
    fontSize: '0.813rem',
    marginTop: '1rem',
    marginBottom: '0.5rem'
  }
});

function OtherInfoNav({
  labelText,
  labelTextStrong,
  classes,
  content,
  current,
  showContent
}) {
  return (
    <div className={classes.root}>
      <Layout>
        <Typography className={classes.label} color="textSecondary">
          {labelText} <strong>{labelTextStrong}</strong>
        </Typography>
        <div className={classes.otherTopicLinks}>
          {content.body.map((c, index) => (
            <ButtonBase
              key={c.id}
              className={classNames({
                [classes.otherTopic]: current !== index
              })}
              onClick={showContent(index)}
            >
              <Typography variant="body2" color="textSecondary">
                {c.value.title}
              </Typography>
            </ButtonBase>
          ))}
        </div>
      </Layout>
    </div>
  );
}

OtherInfoNav.propTypes = {
  labelText: PropTypes.string.isRequired,
  labelTextStrong: PropTypes.string.isRequired,
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  content: PropTypes.shape({}).isRequired,
  showContent: PropTypes.func.isRequired
};

export default withStyles(styles)(OtherInfoNav);
