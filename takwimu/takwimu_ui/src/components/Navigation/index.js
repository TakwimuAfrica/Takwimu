import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import {
  withWidth,
  withStyles,
  Grid,
  Link,
  Drawer,
  IconButton
} from '@material-ui/core';
import { Search, MenuOutlined } from '@material-ui/icons';

import { isWidthUp } from '@material-ui/core/withWidth';
import logoWhite from '../../assets/images/logo-white-all.png';

import DropDowns from './DropDowns';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.primary.main,
    height: '6.313rem',
    padding: '1.25rem',
    justifyContent: 'space-between',
    [theme.breakpoints.up('md')]: {
      justifyContent: 'space-around'
    }
  },
  drawer: {
    backgroundColor: theme.palette.primary.main,
    marginTop: '6.313rem',
    outline: 'none'
  },
  link: {
    margin: '1.375rem 0.7rem',
    [theme.breakpoints.up('sm')]: {
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

  render() {
    const { classes, width } = this.props;
    const { isDrawerOpen } = this.state;
    return (
      <Grid container alignItems="center" className={classes.root}>
        <Grid item>
          <Link href="/">
            <img alt="logo" src={logoWhite} height={22} />
          </Link>
        </Grid>
        {isWidthUp('md', width) ? (
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
        ) : (
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
              <Grid container direction="column" alignItems="center">
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
                <Grid item>
                  <DropDowns />
                </Grid>
              </Grid>
            </Drawer>
          </Fragment>
        )}
      </Grid>
    );
  }
}

Navigation.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  width: PropTypes.isRequired
};

export default withWidth()(withStyles(styles)(Navigation));
