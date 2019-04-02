import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import DropDownContent from './DropDownContent';

import bg from '../../assets/images/file-paragraph-bg.svg';

const styles = {
  container: {
    backgroundImage: `url(${bg})`,
    backgroundRepeat: 'no-repeat'
  }
};

function profile(country) {
  return country.slug;
}

function CountryAnalysis({ classes, countries }) {
  const sortedCountries = countries.sort((a, b) => a.name[0] > b.name[0]);
  return (
    <DropDownContent
      classes={{
        container: classes.container
      }}
      title="Country Analysis"
      description="Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor sit amet."
      countries={sortedCountries}
      profile={profile}
    />
  );
}

CountryAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  countries: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(CountryAnalysis);
