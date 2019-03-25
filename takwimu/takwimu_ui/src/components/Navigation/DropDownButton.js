import React from 'react';
import { PropTypes } from 'prop-types';

import classnames from 'classnames';

import { ButtonBase, withStyles, Grid, Typography } from '@material-ui/core';

import downArrow from '../../assets/down-arrow.svg';
import upArrow from '../../assets/up-arrow.svg';

const styles = theme => ({
  root: {
    margin: '1.563rem',
    color: theme.palette.text.primary,
    outline: 'none'
  },
  img: {
    height: 'fit-content'
  },
  bubble: {
    margin: '-5px -20px',
    padding: '5px 20px',
    backgroundColor: 'white',
    borderRadius: '1.125rem'
  },
  bubbleArrow: {
    position: 'absolute',
    bottom: '-1.438rem',
    borderStyle: 'solid',
    borderWidth: '1.438rem 1.438rem 0',
    borderColor: '#FFFFFF transparent',
    display: 'block',
    width: 0,
    zIndex: 1
  }
});

function DropDownButton({
  classes,
  icon,
  iconActive,
  title,
  handleClick,
  isActive
}) {
  return (
    <ButtonBase
      disableRipple
      disableTouchRipple
      className={classes.root}
      onClick={handleClick}
    >
      <span className={classnames({ [classes.bubble]: isActive })}>
        <Grid
          container
          spacing={16}
          component="span"
          justify="space-around"
          alignItems="center"
        >
          <Grid item component="span">
            <img alt={`${title} Icon`} src={isActive ? iconActive : icon} />
          </Grid>
          <Grid item component="span">
            <Typography
              variant="body1"
              color={isActive ? 'textSecondary' : 'textPrimary'}
              style={{ fontSize: '1.125rem' }}
            >
              {title}
            </Typography>
          </Grid>
          <Grid item component="span">
            {isActive ? (
              <img className={classes.img} alt="Up Arrow" src={upArrow} />
            ) : (
              <img className={classes.img} alt="Down Arrow" src={downArrow} />
            )}
          </Grid>
        </Grid>
      </span>
      <span className={classnames({ [classes.bubbleArrow]: isActive })} />
    </ButtonBase>
  );
}

DropDownButton.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  icon: PropTypes.string.isRequired,
  iconActive: PropTypes.string.isRequired,
  title: PropTypes.string.isRequired,
  isActive: PropTypes.bool.isRequired,
  handleClick: PropTypes.func.isRequired
};

export default withStyles(styles)(DropDownButton);
