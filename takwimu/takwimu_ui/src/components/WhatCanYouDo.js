import React from 'react';

import { Typography, Grid, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';
import Section from './Section';

import reasearchIcon from '../assets/images/a-chart.svg';
import downloadIcon from '../assets/images/cloud-download-93.svg';
import presentIcon from '../assets/images/computer-upload.svg';

const styles = theme => ({
  container: {
    backgroundColor: theme.palette.info.main,
    padding: '2.438rem 0.625rem',
    flexDirection: 'column',
    [theme.breakpoints.up('md')]: {
      flexDirection: 'row'
    },
    [theme.breakpoints.up('lg')]: {
      padding: '2.438rem 5.125rem'
    }
  },
  box: {
    width: '18.125rem',
    height: '16.25rem',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    margin: '1.25rem',
    [theme.breakpoints.up('md')]: {
      margin: '0'
    }
  },
  label: {
    fontWeight: 'bold'
  }
});

function WhatCanYouDo({ classes }) {
  return (
    <Section title="What can you do with Takwimu" titleVariant="h1">
      <Grid
        container
        alignItems="center"
        justify="space-evenly"
        className={classes.container}
      >
        <Grid item>
          <div className={classes.box}>
            <img alt="research" src={reasearchIcon} />
            <Typography variant="body1" className={classes.label}>
              Research
            </Typography>
            <Typography variant="body2">
              Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum
              dolor sit amet.
            </Typography>
          </div>
        </Grid>
        <Grid item>
          <div className={classes.box}>
            <img alt="download" src={downloadIcon} />
            <Typography variant="body1" className={classes.label}>
              Download
            </Typography>
            <Typography variant="body2">
              Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum
              dolor sit amet.
            </Typography>
          </div>
        </Grid>
        <Grid item>
          <div className={classes.box}>
            <img alt="present" src={presentIcon} />
            <Typography variant="body1" className={classes.label}>
              Present
            </Typography>
            <Typography variant="body2">
              Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum
              dolor sit amet.
            </Typography>
          </div>
        </Grid>
      </Grid>
    </Section>
  );
}

WhatCanYouDo.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(WhatCanYouDo);
