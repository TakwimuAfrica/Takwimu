import React from 'react';
import PropTypes from 'prop-types';
import {
  Typography,
  withStyles,
  ButtonBase,
  Button,
  Grid,
  Input,
  Popper,
  Paper,
  ClickAwayListener,
  MenuList,
  MenuItem
} from '@material-ui/core';

import classNames from 'classnames';

import searchIcon from '../../assets/images/icon-search.svg';
import downArrowBlack from '../../assets/images/down-arrow-black.svg';
import upArrowBlack from '../../assets/images/up-arrow-black.svg';
import downArrow from '../../assets/images/down-arrow-green.svg';
// import upArrow from '../../assets/images/up-arrow.svg';

const flagSrc = require.context('../../assets/images/flags', false, /\.svg$/);

const styles = theme => ({
  root: {
    zIndex: '1',
    position: 'absolute',
    top: '99px',
    left: '99px',
    width: '374px',
    height: '544px',
    padding: '23px',
    borderRadius: '0 0 1.063rem 1.063rem',
    border: 'solid 0.063rem rgba(0, 0, 0, 0.19)',
    backgroundColor: '#ffffff',
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'flex-start',
    justifyContent: 'space-between'
  },
  label: {
    fontSize: '15px',
    fontWeight: '600'
  },
  verticalLine: {
    width: '4px',
    height: '194px',
    marginLeft: '17px',
    marginRight: '35px',
    backgroundColor: theme.palette.primary.main
  },
  countryName: {
    marginLeft: '18px',
    marginRight: '12px'
  },
  chooserButton: {
    marginTop: '15px',
    marginBottom: '22px'
  },
  changeCountryLabel: {
    color: '#848484'
  },
  detailLabel: {
    color: '#231f20',
    fontWeight: 'unset'
  },
  detail: {
    fontSize: '32px',
    fontWeight: '600',
    color: '#231f20'
  },
  datasetName: {
    fontSize: '15px',
    textDecoration: 'underline',
    marginRight: '10px',
    marginLeft: '4px'
  },
  searchBar: {
    position: 'relative',
    width: '100%'
  },
  searchBarInput: {
    padding: '10px',
    borderRadius: '4px',
    border: 'solid 1px rgba(151, 151, 151, 0.3)'
  },
  searchBarIcon: {
    position: 'absolute',
    right: '16px',
    top: '16px'
  },
  popperIndex: {
    zIndex: 2
  }
});

class ProfileDetail extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      searchTerm: '',
      releasesMenuIsOpen: false,
      showSearchResults: false
    };

    this.toggleReleasesMenu = this.toggleReleasesMenu.bind(this);
    this.showSearchResults = this.showSearchResults.bind(this);
    this.hideSearchResults = this.hideSearchResults.bind(this);
    this.handleSearch = this.handleSearch.bind(this);
  }

  toggleReleasesMenu() {
    this.setState(prevState => ({
      releasesMenuIsOpen: !prevState.releasesMenuIsOpen
    }));
  }

  showSearchResults() {
    this.setState({
      showSearchResults: true
    });
  }

  hideSearchResults() {
    this.setState({
      showSearchResults: false
    });
  }

  handleSearch(e) {
    const { searchTerm } = this.state;
    const newSearchTerm = e && e.target ? e.target.value : searchTerm;
    this.setState({ searchTerm: newSearchTerm }, () => {
      if (newSearchTerm.length) {
        this.showSearchResults();
      } else {
        this.hideSearchResults();
      }
    });
  }

  render() {
    const { showSearchResults, releasesMenuIsOpen } = this.state;
    const { classes } = this.props;
    return (
      <div className={classes.root}>
        <div>
          <Typography
            variant="caption"
            className={classNames([classes.label, classes.changeCountryLabel])}
          >
            Change Country
          </Typography>

          <ButtonBase
            disableRipple
            disableTouchRipple
            className={classes.chooserButton}
            onClick={window.toggleDrawer('topic')}
          >
            <img alt="" height="37" src={flagSrc('./south-africa.svg')} />
            <Typography variant="subtitle1" className={classes.countryName}>
              South Africa
            </Typography>
            <img alt="" src={downArrow} />
          </ButtonBase>
        </div>

        <Grid container direction="row" wrap="nowrap">
          <Grid item>
            <div className={classes.verticalLine} />
          </Grid>
          <Grid item container>
            <Grid item>
              <Typography
                variant="body1"
                className={classNames([classes.label, classes.detailLabel])}
              >
                Population
              </Typography>
              <Typography variant="body1" className={classes.detail}>
                55,653,654
              </Typography>
            </Grid>
            <Grid item>
              <Typography
                variant="body1"
                className={classNames([classes.label, classes.detailLabel])}
              >
                Square kilometres
              </Typography>
              <Typography variant="body1" className={classes.detail}>
                1,229,341.5
              </Typography>
            </Grid>
            <Grid item>
              <Typography
                variant="body1"
                className={classNames([classes.label, classes.detailLabel])}
              >
                People per square kilometre
              </Typography>
              <Typography variant="body1" className={classes.detail}>
                45.3
              </Typography>
            </Grid>
          </Grid>
        </Grid>

        <Grid container>
          <Typography className={classes.label}>Release:</Typography>
          <ButtonBase
            disableRipple
            disableTouchRipple
            buttonRef={node => {
              this.releasesButton = node;
            }}
            onClick={this.toggleReleasesMenu}
          >
            <Typography className={classes.datasetName}>
              Community Survey 2016
            </Typography>
            <img
              alt=""
              src={releasesMenuIsOpen ? upArrowBlack : downArrowBlack}
            />
          </ButtonBase>

          <Popper
            className={classes.popperIndex}
            open={releasesMenuIsOpen}
            anchorEl={this.releasesButton}
            style={{
              width: this.releasesButton
                ? this.releasesButton.clientWidth
                : null
            }}
          >
            <ClickAwayListener onClickAway={this.toggleReleasesMenu}>
              <Paper>
                <MenuList>
                  <MenuItem>Example</MenuItem>
                </MenuList>
              </Paper>
            </ClickAwayListener>
          </Popper>
        </Grid>

        <Grid container>
          <div
            ref={node => {
              this.searchBarRef = node;
            }}
            className={classes.searchBar}
          >
            <Input
              fullWidth
              disableUnderline
              className={classes.searchBarInput}
              onFocus={this.handleSearch}
              onBlur={this.hideSearchResults}
              placeholder="Compare with"
              onChange={this.handleSearch}
            />
            <img alt="" src={searchIcon} className={classes.searchBarIcon} />
          </div>

          <Popper
            className={classes.popperIndex}
            open={showSearchResults}
            anchorEl={this.searchBarRef}
            style={{
              width: this.searchBarRef ? this.searchBarRef.clientWidth : null
            }}
          >
            <Paper>
              <MenuList>
                <MenuItem>Example</MenuItem>
              </MenuList>
            </Paper>
          </Popper>
        </Grid>

        <Button fullWidth>Read the full country analysis</Button>
      </div>
    );
  }
}

ProfileDetail.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(ProfileDetail);
