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

function DataByTopic({ classes, countries }) {
  const sortedCountries = countries.sort((a, b) => a.name[0] > b.name[0]);
  return (
    <DropDownContent
      classes={{
        container: classes.container
      }}
      title="Data by Topic"
      description="Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor sit amet."
      countries={sortedCountries}
    />
  );
}

DataByTopic.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  countries: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(DataByTopic);
