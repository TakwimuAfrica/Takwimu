import React from 'react';
import { PropTypes } from 'prop-types';

import classNames from 'classnames';

import { ButtonBase, Typography, withStyles } from '@material-ui/core';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.primary.main,
    height: '14.875rem',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',

    // Inheritable by `A` component
    textDecoration: 'none'
  },
  cardDual: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '21.09375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '28.125rem'
    }
  },
  cardTriple: {
    width: '100%',
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

function Card({ classes, children, component, href, onClick, variant }) {
  const variantClass =
    variant === 'triple' ? classes.cardTriple : classes.cardDual;
  return (
    <ButtonBase
      href={href}
      onClick={onClick}
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
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]),
  classes: PropTypes.shape({}).isRequired,
  component: PropTypes.elementType,
  href: PropTypes.string,
  onClick: PropTypes.func,
  variant: PropTypes.oneOf(['dual', 'triple'])
};

Card.defaultProps = {
  children: '',
  component: 'button',
  href: null,
  onClick: null,
  variant: 'triple'
};
export default withStyles(styles)(Card);
