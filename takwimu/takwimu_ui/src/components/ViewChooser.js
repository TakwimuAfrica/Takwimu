import React, { Component } from 'react';
import { PropTypes } from 'prop-types';
import {
  Grid,
  Typography,
  withStyles,
  Select,
  FormControl,
  OutlinedInput,
  Popper,
  Paper,
  MenuList,
  MenuItem,
  TextField
} from '@material-ui/core';

import KeyboardArrowDown from '@material-ui/icons/KeyboardArrowDown';
import KeyboardArrowUp from '@material-ui/icons/KeyboardArrowUp';

import Section from './Section';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.background.light,
    height: '13.9375rem',
    paddingTop: '3.125rem',
    paddingBottom: '3.5rem',
    paddingLeft: '2.8125rem',
    paddingRight: '2.8125rem'
  },
  button: {
    borderRadius: 0,
    padding: 0
  },
  keyboardArrow: {
    color: '#29a87c'
  },
  formControl: {
    width: '258px'
  },
  menu: {
    paddingTop: 0,
    backgroundColor: 'red'
  },
  textField: {
    marginLeft: '0.9375rem',
    marginRight: '1.0625rem',
    flexBasis: 258
  },
  title: {
    paddingBottom: '2.375rem'
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

class ViewChooser extends Component {
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
    const { classes, countries } = this.props;
    const { topic, country, topicActive, countryActive } = this.state;
    const sortedCountries = countries.sort((a, b) => a.name[0] > b.name[0]);
    return (
      <Section classes={{ root: classes.root }}>
        <Typography variant="body2" className={classes.title}>
          View analysis or data for a specific country
        </Typography>
        <Grid container direction="row" display="flex" alignItems="center">
          <Typography variant="body2">Show me</Typography>
          <FormControl variant="outlined" className={classes.formControl}>
            <Select
              value={topic}
              displayEmpty
              onChange={this.handleTopicChange}
              MenuProps={{
                className: classes.menu
              }}
              IconComponent={() => <DropdownAction isActive={topicActive} />}
              input={
                <OutlinedInput
                  name="topic"
                  id="outlined-age-simple"
                  classes={{ formControl: classes.formControl }}
                  endAdornment={<DropdownAction isActive={topicActive} />}
                />
              }
            >
              <MenuItem value="">Data by topic</MenuItem>
              <MenuItem value={10}>Ten</MenuItem>
              <MenuItem value={20}>Twenty</MenuItem>
              <MenuItem value={30}>Thirty</MenuItem>
            </Select>
          </FormControl>
          <TextField
            autoFocus={false}
            onChange={this.handleTopicChange}
            variant="outlined"
            placeholder="Data by topic"
            className={classes.textField}
            SelectProps={{
              MenuProps: {
                className: classes.menu
              }
            }}
            InputProps={{
              endAdornment: (
                <DropdownAction
                  isActive={topicActive}
                  handleClick={this.handleTopicDropdown}
                />
              )
            }}
          />
          <Popper className={classes.popperIndex} open={topicActive}>
            <Paper>
              <MenuList>
                {sortedCountries.map(xcountry => (
                  <MenuItem>{xcountry.name}</MenuItem>
                ))}
              </MenuList>
            </Paper>
          </Popper>
          <Typography variant="body2"> for</Typography>
          <TextField
            select
            variant="outlined"
            onChange={this.handleCountryChange}
            className={classes.textField}
            placeholder="Country"
            value={country}
            InputProps={{
              endAdornment: (
                <DropdownAction
                  isActive={countryActive}
                  handleClick={this.handleCountryDropdown}
                />
              )
            }}
          />

          <Popper className={classes.popperIndex} open={countryActive}>
            <Paper>
              <MenuList>
                <MenuItem>Example</MenuItem>
              </MenuList>
            </Paper>
          </Popper>
        </Grid>
      </Section>
    );
  }
}

ViewChooser.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  countries: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(ViewChooser);
