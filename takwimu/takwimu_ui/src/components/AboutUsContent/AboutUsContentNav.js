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
    '& > button:nth-child(2n)': {
      margin: '0 3.125rem'
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

function AboutContentNav({
  classes,
  current,
  contentHeadings,
  changeActiveContent
}) {
  return (
    <div className={classes.root}>
      <Layout>
        <Typography className={classes.label} color="textSecondary">
          On this page
        </Typography>
        <div className={classes.otherTopicLinks}>
          {contentHeadings.map((item, index) => (
            <ButtonBase
              className={classNames({
                [classes.otherTopic]: current !== index
              })}
              key={item.link}
              onClick={changeActiveContent(index)}
            >
              <Typography variant="body2" color="textSecondary">
                {item.title}
              </Typography>
            </ButtonBase>
          ))}
        </div>
      </Layout>
    </div>
  );
}

AboutContentNav.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.shape([]).isRequired,
  changeActiveContent: PropTypes.func.isRequired
};

export default withStyles(styles)(AboutContentNav);
