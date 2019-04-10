import React, { Component } from 'react';
import { PropTypes } from 'prop-types';
import {
  Typography,
  withStyles,
  InputAdornment,
  IconButton,
  Popper,
  Paper,
  MenuList,
  MenuItem,
  TextField
} from '@material-ui/core';

import downArrow from '../assets/images/down-arrow.svg';
import upArrow from '../assets/images/up-arrow.svg';

import Section from './Section';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.background.light,
    height: '13.9375rem',
    paddingTop: '3.125rem',
    paddingBottom: '3.5rem',
    paddingLeft: '2.8125rem',
    paddingRight: '2.8125rem'
  }
});

function DropdownAdornment({ classes, isActive, handleClick }) {
  return (
    <InputAdornment position="end">
      <IconButton onClick={handleClick}>
        <img
          className={classes.img}
          alt="Arrow"
          src={isActive ? upArrow : downArrow}
        />
      </IconButton>
    </InputAdornment>
  );
}

DropdownAdornment.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  isActive: PropTypes.bool.isRequired,
  handleClick: PropTypes.func.isRequired
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
    const { classes } = this.props;
    const { topic, country, topicActive, countryActive } = this.state;
    return (
      <Section classes={{ root: classes.root }}>
        <Typography variant="body2">
          View analysis or data for a specific country
        </Typography>
        <div>
          <Typography variant="body2">Show me</Typography>
          <TextField
            select
            value={topic}
            onChange={this.handleTopicChange}
            displayEmpty
            name="topic"
            className={classes.searchBarInput}
            placeholder="Data by topic"
            InputProps={{
              endAdornment: (
                <DropdownAction
                  isActive={topicActive}
                  handleClick={this.handleTopicChange}
                />
              )
            }}
          />
          <Typography variant="body2"> for</Typography>
          <TextField
            select
            value={country}
            onChange={this.handleCountryChange}
            displayEmpty
            name="country"
            className={classes.searchBarInput}
            placeholder="Data by topic"
            InputProps={{
              endAdornment: (
                <DropdownAction
                  isActive={countryActive}
                  handleClick={this.handleCountryChange}
                />
              )
            }}
          />

          <Popper className={classes.popperIndex}>
            <Paper>
              <MenuList>
                <MenuItem>Example</MenuItem>
              </MenuList>
            </Paper>
          </Popper>
        </div>
      </Section>
    );
  }
}

ViewChooser.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(ViewChooser);
