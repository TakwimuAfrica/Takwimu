import React from 'react';
import { PropTypes } from 'prop-types';

import classNames from 'classnames';

import { withStyles, ButtonBase } from '@material-ui/core';

import { RichTypography } from '../core';

const styles = theme => ({
  button: {
    width: '100%',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#ededec',
    padding: '2.015625rem 0.75rem',
    [theme.breakpoints.up('md')]: {
      justifyContent: 'flex-start',
      paddingTop: '2.015625rem', // .75 of lg
      paddingLeft: '1.78125rem', // .75 of lg
      paddingBottom: '2.015625rem', // .75 of lg
      paddingRight: '0.84375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      paddingTop: '2.6875rem',
      paddingLeft: '2.375rem',
      paddingBottom: '2.6875rem',
      paddingRight: '1.125rem'
    }
  },
  currentButton: {
    backgroundColor: '#29a87c', // bluey-green
    borderLeft: '0.375rem solid #a0d9b3', // hospital-green
    paddingLeft: '0.375rem',
    [theme.breakpoints.up('md')]: {
      paddingLeft: '1.78125rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      paddingLeft: '2.375rem'
    }
  },
  label: {
    width: '100%',
    textAlign: 'left'
  },
  currentLabel: {
    color: 'white'
  }
});

function AnalysisListItem({ children, classes, isCurrent, onClick }) {
  return (
    <ButtonBase
      className={classNames(classes.button, {
        [classes.currentButton]: isCurrent
      })}
      onClick={onClick}
    >
      <RichTypography
        variant="subtitle2"
        className={classNames(classes.label, {
          [classes.currentLabel]: isCurrent
        })}
      >
        {children}
      </RichTypography>
    </ButtonBase>
  );
}
AnalysisListItem.propTypes = {
  children: PropTypes.string.isRequired,
  classes: PropTypes.shape({}).isRequired,
  isCurrent: PropTypes.bool,
  onClick: PropTypes.func.isRequired
};

AnalysisListItem.defaultProps = {
  isCurrent: false
};

export default withStyles(styles)(AnalysisListItem);
