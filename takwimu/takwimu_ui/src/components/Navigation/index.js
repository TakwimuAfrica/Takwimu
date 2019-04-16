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
  MenuItem,
  ButtonBase
} from '@material-ui/core';
import { Search, MenuOutlined } from '@material-ui/icons';

import classeNames from 'classnames';

import { isWidthUp } from '@material-ui/core/withWidth';
import logoWhite from '../../assets/images/logo-white-all.png';

import Layout from '../Layout';
import DropDowns, { DropDownDrawer } from './DropDowns';
import SearchDrawer from './SearchDrawer';

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
    color: theme.palette.text.secondary,
    margin: '1.375rem 3.25rem',
    [theme.breakpoints.up('md')]: {
      margin: '0.625rem'
    },
    [theme.breakpoints.up('lg')]: {
      margin: '1.375rem'
    },

    // Override original Takwimu & Bootstrap styles
    '&:hover': {
      color: theme.palette.text.secondary,
      textDecoration: 'none'
    }
  },
  searchButton: {
    color: theme.palette.text.secondary,
    marginBottom: '0.313rem' // Move to align icon
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
    this.toggleMobileDrawer = this.toggleMobileDrawer.bind(this);

    window.toggleDrawer = this.toggleDrawer;
  }

  toggleMobileDrawer() {
    this.setState(prevState => ({
      isMobileDrawerOpen: !prevState.isMobileDrawerOpen,
      openDrawer: !prevState.isMobileDrawerOpen ? prevState.openDrawer : null
    }));
  }

  toggleDrawer(drawer) {
    const { openDrawer, isMobileDrawerOpen } = this.state;
    const newOpenDrawer = openDrawer !== drawer ? drawer : null;
    const hasDrawer = newOpenDrawer !== null || isMobileDrawerOpen;

    return () => {
      const { width } = this.props;
      this.setState({
        isMobileDrawerOpen: isWidthUp('md', width) ? false : hasDrawer,
        openDrawer: newOpenDrawer
      });
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
    const {
      classes,
      takwimu: { countries }
    } = this.props;
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
          <Link className={classes.link} href="/about">
            About Us
          </Link>
          <Link className={classes.link} href="/about">
            FAQs
          </Link>
          <Link className={classes.link} href="/contact-us">
            Contact Us
          </Link>
          <ButtonBase
            className={classes.searchButton}
            onClick={this.toggleDrawer('search')}
          >
            <Search className={classes.search} />
          </ButtonBase>
        </Grid>
      </Fragment>
    );
  }

  renderDropDownDrawer() {
    const {
      width,
      takwimu: { countries }
    } = this.props;
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

  renderSearchDrawer() {
    const { openDrawer } = this.state;
    return (
      <SearchDrawer active={openDrawer === 'search'}>
        {this.renderNavBar()}
      </SearchDrawer>
    );
  }

  renderMobileDrawer() {
    const {
      classes,
      takwimu: { countries }
    } = this.props;
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
              <Link className={classes.link} href="/about">
                About Us
              </Link>
            </MenuItem>
            <MenuItem>
              <Link className={classes.link} href="/about">
                FAQs
              </Link>
            </MenuItem>
            <MenuItem>
              <Link className={classes.link} href="/contact-us">
                Contact Us
              </Link>
            </MenuItem>
            <MenuItem>
              <Link
                className={classeNames([classes.link, classes.iconLink])}
                href="/search"
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
        {this.renderSearchDrawer()}
      </Fragment>
    );
  }
}

Navigation.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  width: PropTypes.string.isRequired,
  takwimu: PropTypes.shape({
    countries: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired
  }).isRequired
};

export default withWidth()(withStyles(styles)(Navigation));
