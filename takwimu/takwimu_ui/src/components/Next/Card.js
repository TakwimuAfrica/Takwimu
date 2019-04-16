import React from 'react';
import { PropTypes } from 'prop-types';

import classNames from 'classnames';

import { ButtonBase, Typography, withStyles } from '@material-ui/core';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.primary.main,
    width: '100%',
    height: '14.875rem',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',

    // Inheritable by `A` component
    textDecoration: 'none'
  },
  cardDual: {
    [theme.breakpoints.up('md')]: {
      width: '20.09375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '27.125rem'
    }
  },
  cardTriple: {
    [theme.breakpoints.up('md')]: {
      width: '18.375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '24.5rem'
    }
  },
  title: {
    color: '#fff',
    textAlign: 'center',
    marginTop: '5.25rem',
    marginBottom: '5.25rem'
  }
});

function Card({ classes, children, component, href, variant }) {
  const variantClass =
    variant === 'triple' ? classes.cardTriple : classes.cardDual;
  return (
    <ButtonBase
      href={href}
      className={classNames(classes.root, variantClass)}
      color="primary"
      component={component}
    >
      <Typography
        variant="subtitle1"
        className={classes.title}
        underline="none"
      >
        {children}
      </Typography>
    </ButtonBase>
  );
}

Card.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]),
  href: PropTypes.string,
  variant: PropTypes.oneOf(['dual', 'triple']),
  component: PropTypes.elementType
};

Card.defaultProps = {
  children: '',
  href: null,
  variant: 'triple',
  component: 'button'
};
export default withStyles(styles)(Card);
