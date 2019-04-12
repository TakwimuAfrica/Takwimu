import React, { Component } from 'react';
import { PropTypes } from 'prop-types';
import {
  Grid,
  Typography,
  withStyles,
  Select,
  FormControl,
  Input,
  Button,
  MenuItem
} from '@material-ui/core';

import KeyboardArrowDown from '@material-ui/icons/KeyboardArrowDown';
import KeyboardArrowUp from '@material-ui/icons/KeyboardArrowUp';

import Section from './Section';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.background.light,
    height: '22rem',
    paddingTop: '3.125rem',
    paddingBottom: '3.5rem',
    paddingLeft: '2.8125rem',
    paddingRight: '2.8125rem',
    [theme.breakpoints.up('md')]: {
      height: '13.9375rem'
    }
  },
  keyboardArrow: {
    top: 'calc(50% - 12px)',
    right: theme.spacing.unit * 2.5,
    position: 'absolute',
    pointerEvents: 'none',
    color: '#29a87c'
  },
  selectText: {
    fontSize: theme.typography.body1.fontSize,
    fontFamily: theme.typography.body1.fontFamily
  },
  selectInput: {
    borderBottom: 0,
    transition: 0
  },
  menuPaper: {
    backgroundColor: theme.palette.background.default
  },
  menuList: {
    fontSize: theme.typography.body1.fontSize,
    fontFamily: theme.typography.body1.fontFamily,
    '&:selected': {
      backgroundColor: theme.palette.background.default
    }
  },
  selectForm: {
    marginLeft: '0.9375rem',
    marginRight: '1.0625rem',
    flexBasis: 258
  },
  selectMenu: {
    borderRadius: theme.spacing.unit * 0.5,
    border: '1px solid rgba(151, 151, 151, 0.3)',
    paddingLeft: theme.spacing.unit,
    paddingTop: theme.spacing.unit * 2,
    paddingBottom: theme.spacing.unit * 2,
    backgroundColor: theme.palette.background.default
  },
  selectbuttonroot: {
    width: '6.8125rem',
    padding: 0,
    marginLeft: '1rem',
    [theme.breakpoints.up('md')]: {
      width: '8rem'
    },
    [theme.breakpoints.up('lg')]: {
      marginLeft: '1.875rem',
      width: '8.8125rem'
    }
  },
  selectbuttonlabel: {
    fontSize: theme.typography.body1.fontSize,
    fontFamily: theme.typography.body1.fontFamily,
    paddingTop: '1.125rem',
    paddingBottom: '1.0625rem'
  },
  title: {
    paddingBottom: '2.375rem',
    fontWeight: 'bold'
  }
});

function DropdownAdornment({ classes, isActive }) {
  if (isActive) {
    return <KeyboardArrowUp className={classes.keyboardArrow} />;
  }
  return <KeyboardArrowDown className={classes.keyboardArrow} />;
}

DropdownAdornment.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  isActive: PropTypes.bool.isRequired
};

const DropdownAction = withStyles(styles)(DropdownAdornment);

class ViewAnalysis extends Component {
  constructor() {
    super();
    this.state = {
      topic: '',
      country: 'South Africa',
      topicActive: false,
      countryActive: false
    };
    this.handleTopicChange = this.handleTopicChange.bind(this);
    this.handleCountryChange = this.handleCountryChange.bind(this);
    this.handleCountryDropdown = this.handleCountryDropdown.bind(this);
    this.handleTopicDropdown = this.handleTopicDropdown.bind(this);
  }

  handleTopicDropdown() {
    this.setState(prevState => ({
      topicActive: !prevState.topicActive
    }));
  }

  handleCountryDropdown() {
    this.setState(prevState => ({
      countryActive: !prevState.countryActive
    }));
  }

  handleTopicChange(event) {
    this.setState({
      topic: event.target.value
    });
  }

  handleCountryChange(event) {
    this.setState({
      country: event.target.value
    });
  }

  render() {
    const {
      classes,
      takwimu: { countries }
    } = this.props;
    const { topic, country, topicActive, countryActive } = this.state;
    const sortedCountries = countries.sort((a, b) => a.name[0] > b.name[0]);
    return (
      <Section classes={{ root: classes.root }}>
        <Typography variant="body1" className={classes.title}>
          View analysis or data for a specific country
        </Typography>
        <Grid container direction="row" display="flex" alignItems="center">
          <Typography variant="body1">Show me</Typography>
          <FormControl variant="outlined" className={classes.selectForm}>
            <Select
              value={topic}
              displayEmpty
              onChange={this.handleTopicChange}
              classes={{
                root: classes.selectText,
                selectMenu: classes.selectMenu
              }}
              IconComponent={() => <DropdownAction isActive={topicActive} />}
              onClick={this.handleTopicDropdown}
              input={<Input disableUnderline />}
              MenuProps={{
                classes: { paper: classes.menuPaper },
                anchorOrigin: {
                  vertical: 'bottom',
                  horizontal: 'left'
                },
                transformOrigin: {
                  vertical: 'top',
                  horizontal: 'left'
                },
                getContentAnchorEl: null
              }}
            >
              <MenuItem className={classes.menuList} value="">
                Data by topic
              </MenuItem>
              <MenuItem className={classes.menuList} value="sdg-indicators">
                SDG Indicators
              </MenuItem>
            </Select>
          </FormControl>
          <Typography variant="body1"> for</Typography>
          <FormControl variant="outlined" className={classes.selectForm}>
            <Select
              value={country}
              displayEmpty
              onChange={this.handleCountryChange}
              classes={{
                root: classes.selectText,
                selectMenu: classes.selectMenu
              }}
              IconComponent={() => <DropdownAction isActive={countryActive} />}
              onClick={this.handleCountryDropdown}
              input={<Input disableUnderline />}
              MenuProps={{
                classes: { paper: classes.menuPaper },
                anchorOrigin: {
                  vertical: 'bottom',
                  horizontal: 'left'
                },
                transformOrigin: {
                  vertical: 'top',
                  horizontal: 'left'
                },
                getContentAnchorEl: null
              }}
            >
              {sortedCountries.map(xcountry => (
                <MenuItem
                  className={classes.menuList}
                  key={xcountry.slug}
                  value={xcountry.slug}
                >
                  {xcountry.name}
                </MenuItem>
              ))}
            </Select>
          </FormControl>
          <Button
            href={`/profiles/${country}/#${topic}`}
            classes={{
              label: classes.selectbuttonlabel,
              root: classes.selectbuttonroot
            }}
          >
            Go
          </Button>
        </Grid>
      </Section>
    );
  }
}

ViewAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    countries: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired
  }).isRequired
};

export default withStyles(styles)(ViewAnalysis);
