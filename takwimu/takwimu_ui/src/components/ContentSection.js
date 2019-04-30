import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import Section from './Section';

const styles = theme => ({
  root: {
    width: '100%',
    margin: 0,
    [theme.breakpoints.up('md')]: {
      width: '43.734375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '58.3125rem'
    }
  }
});

function ContentSection({ children, classes, title, variant, ...props }) {
  return (
    <Section
      classes={{ root: classes.root }}
      title={title}
      variant={variant}
      {...props}
    >
      {children}
    </Section>
  );
}

ContentSection.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired,
  title: PropTypes.string,
  variant: PropTypes.string
};

ContentSection.defaultProps = {
  title: null,
  variant: 'h2'
};

export default withStyles(styles)(ContentSection);
