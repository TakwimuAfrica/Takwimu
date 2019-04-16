import React from 'react';
import PropTypes from 'prop-types';

import { Grid, Drawer, Input, withStyles } from '@material-ui/core';

// import rightArrow from '../../assets/images/right-arrow.svg';
import rightArrowTransparent from '../../assets/images/right-arrow-transparent.svg';

import Layout from '../Layout';

const styles = theme => ({
  root: {
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'flex-start',
    [theme.breakpoints.up('md')]: {
      display: 'unset'
    }
  },
  modal: {
    top: '0'
  },
  backdrop: {
    marginTop: '0',
    backgroundColor: 'transparent'
  },
  drawer: {
    backgroundColor: theme.palette.primary.main,
    outline: 'none'
  },
  arrow: {
    marginLeft: '4.406rem'
  },
  searchField: {
    height: '71px',
    width: '750px',
    fontFamily: theme.typography.fontText,
    fontSize: '57px',
    fontWeight: '600',
    opacity: 1,
    color: 'white',
    fontStyle: 'normal',
    fontStretch: 'normal',
    lineHeight: 'normal',
    letterSpacing: 'normal'
  },
  searchFieldPlaceholder: {
    opacity: 0.59
  },
  searchFieldBackground: {
    padding: '20px',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: '9px',
    backgroundColor: '#d8d8d826'
  }
});

function SearchDrawer({ classes, children, active, toggle }) {
  return (
    <Drawer
      anchor="top"
      ModalProps={{
        className: classes.modal
      }}
      BackdropProps={{
        className: classes.backdrop
      }}
      PaperProps={{
        className: classes.drawer
      }}
      open={active}
      elevation={0}
      transitionDuration={0}
      onEscapeKeyDown={toggle}
      onBackdropClick={toggle}
    >
      {children}
      <div style={{ marginTop: '100px', height: '100vh' }}>
        <Grid container justify="center">
          <Layout>
            <Grid container direction="row" justify="flex-end">
              <div className={classes.searchFieldBackground}>
                <Input
                  disableUnderline
                  className={classes.searchField}
                  placeholder="What are you looking for ?"
                />
              </div>
              <img
                alt=""
                src={rightArrowTransparent}
                className={classes.arrow}
              />
            </Grid>
          </Layout>
        </Grid>
      </div>
    </Drawer>
  );
}

SearchDrawer.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  active: PropTypes.bool,
  toggle: PropTypes.func.isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired
};

SearchDrawer.defaultProps = {
  active: false
};

export default withStyles(styles)(SearchDrawer);
