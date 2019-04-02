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

import classeNames from 'classnames';

import { isWidthUp } from '@material-ui/core/withWidth';
import logoWhite from '../../assets/images/logo-white-all.png';

import Layout from '../Layout';
import DropDowns, { DropDownDrawer } from './DropDowns';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.primary.main,
    position: 'relative',
    zIndex: '999',
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
    margin: '1.375rem 3.25rem',
    [theme.breakpoints.up('md')]: {
      margin: '0.625rem'
    },
    [theme.breakpoints.up('lg')]: {
      margin: '1.375rem'
    }
  },
  search: {
    marginBottom: '-0.313rem'
  },
  iconLink: {
    margin: '1.375rem 0.7rem'
  }
});

class Navigation extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isMobileDrawerOpen: false,
      openDrawer: null
    };

    this.toggleDrawer = this.toggleDrawer.bind(this);
    window.toggleDrawer = this.toggleDrawer;
    this.toggleMobileDrawer = this.toggleMobileDrawer.bind(this);
  }

  toggleMobileDrawer() {
    this.setState(prevState => ({
      isMobileDrawerOpen: !prevState.isMobileDrawerOpen,
      openDrawer: !prevState.isMobileDrawerOpen ? prevState.openDrawer : null
    }));
  }

  toggleDrawer(drawer) {
    return () => {
      this.setState(prevState => ({
        openDrawer: prevState.openDrawer !== drawer ? drawer : null
      }));
    };
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
            onClick={this.toggleMobileDrawer}
          >
            <MenuOutlined color="inherit" />
          </IconButton>
        </Grid>
      </Fragment>
    );
  }

  renderDesktopNav() {
    const { classes, countries } = this.props;
    const { openDrawer } = this.state;
    return (
      <Fragment>
        <Grid item>
          <DropDowns
            active={openDrawer}
            toggle={this.toggleDrawer}
            countries={countries}
          />
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

  renderDropDownDrawer() {
    const { width, countries } = this.props;
    const { openDrawer } = this.state;
    return (
      <DropDownDrawer
        active={openDrawer}
        countries={countries}
        toggle={
          isWidthUp('md', width)
            ? this.toggleDrawer(null)
            : this.toggleMobileDrawer
        }
      >
        {isWidthUp('md', width) ? this.renderNavBar() : <div />}
      </DropDownDrawer>
    );
  }

  renderMobileDrawer() {
    const { classes, countries } = this.props;
    const { openDrawer, isMobileDrawerOpen } = this.state;
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
        open={isMobileDrawerOpen}
        elevation={0}
        transitionDuration={0}
        onEscapeKeyDown={this.toggleMobileDrawer}
        onBackdropClick={this.toggleMobileDrawer}
      >
        <Grid container direction="column" alignItems="flex-start">
          {this.renderNavBar()}
          <MenuList>
            <DropDowns
              active={openDrawer}
              countries={countries}
              toggle={this.toggleDrawer}
            />
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
              <Link
                className={classeNames([classes.link, classes.iconLink])}
                href="/"
              >
                <Search className={classes.search} />
              </Link>
            </MenuItem>
          </MenuList>
        </Grid>
      </Drawer>
    );
  }

  render() {
    return (
      <Fragment>
        {this.renderNavBar()}
        {this.renderMobileDrawer()}
        {this.renderDropDownDrawer()}
      </Fragment>
    );
  }
}

Navigation.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  width: PropTypes.string.isRequired,
  countries: PropTypes.shape({}).isRequired
};

export default withWidth()(withStyles(styles)(Navigation));
