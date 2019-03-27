import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import {
  withWidth,
  withStyles,
  Grid,
  MenuList,
  Link,
  Drawer,
  IconButton,
  MenuItem
} from '@material-ui/core';
import { Search, MenuOutlined } from '@material-ui/icons';

import { isWidthUp } from '@material-ui/core/withWidth';
import logoWhite from '../../assets/images/logo-white-all.png';

import Layout from '../Layout';
import DropDowns from './DropDowns';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.primary.main,
    width: '100%',
    height: '6.313rem',
    padding: '1.25rem',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center'
  },
  drawer: {
    backgroundColor: theme.palette.primary.main,
    outline: 'none'
  },
  link: {
    margin: '1.375rem 0.7rem',
    [theme.breakpoints.up('md')]: {
      margin: '0.625rem'
    },
    [theme.breakpoints.up('lg')]: {
      margin: '1.375rem'
    }
  },
  search: {
    marginBottom: '-0.313rem'
  }
});

class Navigation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isDrawerOpen: false
    };

    this.toggleDrawer = this.toggleDrawer.bind(this);
  }

  toggleDrawer() {
    this.setState(prevState => ({ isDrawerOpen: !prevState.isDrawerOpen }));
  }

  renderNavBar() {
    const { classes, width } = this.props;
    return (
      <nav className={classes.root}>
        <Layout>
          <Grid container justify="space-between" alignItems="center">
            <Grid item>
              <Link href="/">
                <img alt="logo" src={logoWhite} height={22} />
              </Link>
            </Grid>

            {isWidthUp('md', width)
              ? this.renderDesktopNav()
              : this.renderMobileNav()}
          </Grid>
        </Layout>
      </nav>
    );
  }

  renderMobileNav() {
    return (
      <Fragment>
        <Grid item>
          <IconButton
            disableRipple
            disableTouchRipple
            color="secondary"
            onClick={this.toggleDrawer}
          >
            <MenuOutlined color="inherit" />
          </IconButton>
        </Grid>
      </Fragment>
    );
  }

  renderMobileDrawer() {
    const { classes } = this.props;
    const { isDrawerOpen } = this.state;
    return (
      <Drawer
        anchor="top"
        BackdropProps={{
          style: {
            backgroundColor: 'transparent'
          }
        }}
        PaperProps={{
          className: classes.drawer
        }}
        open={isDrawerOpen}
        elevation={0}
        transitionDuration={0}
        onEscapeKeyDown={this.toggleDrawer}
        onBackdropClick={this.toggleDrawer}
      >
        <Grid container direction="column" alignItems="flex-start">
          {this.renderNavBar()}
          <MenuList>
            <DropDowns />
            <MenuItem>
              <Link className={classes.link} href="/">
                About Us
              </Link>
            </MenuItem>
            <MenuItem>
              <Link className={classes.link} href="/">
                FAQs
              </Link>
            </MenuItem>
            <MenuItem>
              <Link className={classes.link} href="/">
                Contact Us
              </Link>
            </MenuItem>
            <MenuItem>
              <Link className={classes.link} href="/">
                <Search className={classes.search} />
              </Link>
            </MenuItem>
          </MenuList>
        </Grid>
      </Drawer>
    );
  }

  renderDesktopNav() {
    const { classes } = this.props;
    return (
      <Fragment>
        <Grid item>
          <DropDowns />
        </Grid>
        <Grid item>
          <Link className={classes.link} href="/">
            About Us
          </Link>
          <Link className={classes.link} href="/">
            FAQs
          </Link>
          <Link className={classes.link} href="/">
            Contact Us
          </Link>
          <Link className={classes.link} href="/">
            <Search className={classes.search} />
          </Link>
        </Grid>
      </Fragment>
    );
  }

  render() {
    return (
      <Fragment>
        {this.renderNavBar()}
        {this.renderMobileDrawer()}
      </Fragment>
    );
  }
}

Navigation.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  width: PropTypes.string.isRequired
};

export default withWidth()(withStyles(styles)(Navigation));
