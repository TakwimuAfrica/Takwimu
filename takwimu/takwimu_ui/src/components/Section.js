import React from 'react';
import PropTypes from 'prop-types';
import { Grid } from '@material-ui/core';

function Section({ children }) {
  return <Grid container>{children}</Grid>;
}

Section.propTypes = {
  children: PropTypes.isRequired
};

export default Section;
