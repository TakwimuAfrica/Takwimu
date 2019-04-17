import React from 'react';
import PropTypes from 'prop-types';

import {
  Grid,
  Drawer,
  Input,
  withStyles,
  MenuList,
  MenuItem,
  Typography
} from '@material-ui/core';

import classNames from 'classnames';

import rightArrow from '../../assets/images/right-arrow.svg';
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
    '& > input': {
      fontFamily: theme.typography.fontText,
      fontSize: '57px',
      fontWeight: '600',
      opacity: 1,
      color: 'white',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal'
    }
  },
  searchFieldPlaceholder: {
    opacity: 0.59
  },
  searchFieldBackground: {
    padding: '20px',
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    borderRadius: '9px'
  },
  searchFieldBackgroundColor: {
    backgroundColor: '#d8d8d826'
  },
  searchResults: {
    maxWidth: '780px',
    width: '100%',
    marginRight: '100px',
    '& > a': {
      height: '45px'
    },
    '& > a > p': {
      fontFamily: theme.typography.fontText,
      fontSize: '47px',
      fontWeight: 'normal',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 1.7,
      letterSpacing: 'normal'
    }
  }
});

class SearchDrawer extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      backgroundVisible: false,
      searchResults: []
    };

    this.handleSearchInput = this.handleSearchInput.bind(this);
  }

  handleSearchInput(e) {
    const { backgroundVisible } = this.state;
    if (!backgroundVisible && e.target.value.length > 0) {
      this.setState({ backgroundVisible: true });
    } else if (backgroundVisible && e.target.value.length === 0) {
      this.setState({ backgroundVisible: false });
    }

    // TODO:
    if (e.target.value.length > 0) {
      this.setState({
        searchResults: [
          {
            title: 'South Africa',
            link: '/profiles/south-africa'
          },
          {
            title: 'Senegal',
            link: '/profiles/senegal'
          },
          {
            title: 'Nigeria',
            link: '/profiles/nigere'
          }
        ]
      });
    } else {
      this.setState({ searchResults: [] });
    }
  }

  render() {
    const { classes, children, active, toggle } = this.props;
    const { backgroundVisible, searchResults } = this.state;
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
                <div
                  className={classNames(classes.searchFieldBackground, {
                    [classes.searchFieldBackgroundColor]: backgroundVisible
                  })}
                >
                  <Input
                    disableUnderline
                    className={classes.searchField}
                    placeholder="What are you looking for ?"
                    onChange={this.handleSearchInput}
                  />
                </div>
                <img
                  alt=""
                  src={backgroundVisible ? rightArrow : rightArrowTransparent}
                  className={classes.arrow}
                />
              </Grid>
              <Grid container justify="flex-end">
                <MenuList className={classes.searchResults}>
                  {searchResults.map(result => (
                    <MenuItem component="a" href={`${result.link}`}>
                      <Typography color="textSecondary">
                        {result.title}
                      </Typography>
                    </MenuItem>
                  ))}
                </MenuList>
              </Grid>
            </Layout>
          </Grid>
        </div>
      </Drawer>
    );
  }
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
