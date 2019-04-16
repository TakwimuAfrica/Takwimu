import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import DropDownContent from './DropDownContent';

import bg from '../../assets/images/a-chart-bg.svg';

const styles = {
  container: {
    backgroundImage: `url(${bg})`,
    backgroundRepeat: 'no-repeat'
  }
};

function profile(country) {
  return `country-${country.iso_code}-${country.slug}`;
}

function DataByTopic({ classes, countries }) {
  return (
    <DropDownContent
      classes={{
        container: classes.container
      }}
      title="Data by Topic"
      description="Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor sit amet."
      countries={countries}
      profile={profile}
    />
  );
}

DataByTopic.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  countries: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired
};

export default withStyles(styles)(DataByTopic);
