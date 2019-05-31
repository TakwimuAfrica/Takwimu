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

function CountryAnalysis({
  classes,
  countries,
  navigation: { country_analysis: countryAnalysis }
}) {
  return (
    <DropDownContent
      classes={{
        container: classes.container
      }}
      title="Country Analysis"
      description={countryAnalysis}
      countries={countries}
      profile={profile}
    />
  );
}

CountryAnalysis.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  countries: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  navigation: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(CountryAnalysis);
