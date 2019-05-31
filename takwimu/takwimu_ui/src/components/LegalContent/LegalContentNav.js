import React from 'react';

import { Typography, ButtonBase, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import classNames from 'classnames';

import Layout from '../Layout';
import useScrollListener from '../../useScrollListener';

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
  shadow: {
    boxShadow: '0 2px 6px 2px rgba(0, 0, 0, 0.27)'
  },
  otherTopicLinks: {
    '& > button:nth-child(2n)': {
      margin: '0 3.125rem'
    }
  },
  otherTopic: {
    textDecoration: 'underline'
  },
  topicSelected: {
    textDecoration: 'none',
    fontWeight: 'bold'
  },
  label: {
    fontSize: '0.813rem',
    marginTop: '1rem',
    marginBottom: '0.5rem'
  }
});

function LegalContentNav({
  classes,
  title,
  current,
  contentHeadings,
  changeActiveContent
}) {
  const showShadow = useScrollListener(10);
  const generateHref = index => `/${contentHeadings[index].link}`;
  return (
    <div className={classNames(classes.root, { [classes.shadow]: showShadow })}>
      <Layout>
        <Typography className={classes.label} color="textSecondary">
          {title}
        </Typography>
        <div className={classes.otherTopicLinks}>
          {contentHeadings.map((item, index) => (
            <ButtonBase
              key={item.link}
              onClick={e => {
                e.preventDefault();

                window.history.pushState(null, '', generateHref(index));
                changeActiveContent(index)();
              }}
            >
              <Typography
                variant="body2"
                color="textSecondary"
                className={classNames(classes.otherTopic, {
                  [classes.topicSelected]: current === index
                })}
              >
                {item.title}
              </Typography>
            </ButtonBase>
          ))}
        </div>
      </Layout>
    </div>
  );
}

LegalContentNav.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string.isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  current: PropTypes.number.isRequired,
  changeActiveContent: PropTypes.func.isRequired
};

export default withStyles(styles)(LegalContentNav);
