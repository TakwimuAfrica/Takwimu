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
    alignItems: 'flex-start',
    [theme.breakpoints.up('md')]: {
      flexDirection: 'row',
      alignItems: 'space-between'
    },
    [theme.breakpoints.up('lg')]: {
      padding: '2.438rem 5.125rem'
    }
  },
  box: {
    width: '100%',
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    margin: '1.25rem',
    [theme.breakpoints.up('md')]: {
      height: '16.25rem',
      width: '18.125rem',
      margin: '0'
    }
  },
  label: {
    fontWeight: 'bold'
  }
});

// These icons will be reused in the order written here if there are more
// than three uses
const icons = [reasearchIcon, downloadIcon, presentIcon];

function WhatYouCanDoWithTakwimu({
  classes,
  takwimu: {
    page: {
      what_you_can_do_with_takwimu: { value: whatYouCanDo }
    }
  }
}) {
  if (!whatYouCanDo) {
    return null;
  }

  const { title, uses_of_takwimu: usesOfTakwimu } = whatYouCanDo;

  return (
    <Section title={title}>
      {usesOfTakwimu && usesOfTakwimu.length > 0 && (
        <Grid container justify="flex-start" className={classes.container}>
          {usesOfTakwimu.map((u, i) => (
            <Grid key={u.value.title} item>
              <div className={classes.box}>
                <img alt="research" src={icons[i]} />
                <Typography
                  variant="body1"
                  className={classes.label}
                  dangerouslySetInnerHTML={{ __html: u.value.title }}
                />
                <Typography
                  variant="body2"
                  dangerouslySetInnerHTML={{ __html: u.value.description }}
                />
              </div>
            </Grid>
          ))}
        </Grid>
      )}
    </Section>
  );
}

WhatYouCanDoWithTakwimu.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    page: PropTypes.shape({
      what_you_can_do_with_takwimu: PropTypes.shape({
        value: PropTypes.shape({
          title: PropTypes.string,
          uses_of_takwimu: PropTypes.arrayOf(
            PropTypes.shape({
              value: PropTypes.shape({
                title: PropTypes.string,
                description: PropTypes.string
              })
            })
          )
        })
      }).isRequired
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(WhatYouCanDoWithTakwimu);
