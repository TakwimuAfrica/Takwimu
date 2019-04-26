import React from 'react';
import PropTypes from 'prop-types';
import { Typography, withStyles } from '@material-ui/core';

import Layout from './Layout';

const styles = theme => ({
  root: {
    margin: '0 auto'
  },
  title: {
    margin: '2.375rem 0',
    [theme.breakpoints.up('md')]: {
      width: '51.125rem'
    }
  }
});

function Section({ children, classes, title, variant, ...props }) {
  return (
    <Layout classes={{ root: classes.root }} {...props}>
      {title && (
        <Typography
          variant={variant}
          className={classes.title}
          dangerouslySetInnerHTML={{
            __html: title
          }}
        />
      )}
      {children}
    </Layout>
  );
}

Section.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired,
  title: PropTypes.string,
  variant: PropTypes.string
};

Section.defaultProps = {
  title: null,
  variant: 'h2'
};

export default withStyles(styles)(Section);
