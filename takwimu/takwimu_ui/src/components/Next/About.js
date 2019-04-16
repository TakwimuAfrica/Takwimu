import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Grid } from '@material-ui/core';

import A from '../A';
import Card from './Card';
import Section from '../Section';

const styles = theme => ({
  root: {
    flexGrow: 1,
    paddingBottom: '6.25rem'
  },
  link: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: 'auto'
    }
  },
  cardMargin: {
    marginTop: '2rem',
    [theme.breakpoints.up('md')]: {
      marginTop: 0,
      marginLeft: '1.632352941rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      marginLeft: '2.176470588rem'
    }
  }
});
function AboutWhereToNext({
  classes,
  takwimu: {
    settings: { socialMedia }
  }
}) {
  return (
    <Section title="Where to next..." variant="h3">
      <Grid
        container
        justify="center"
        alignItems="center"
        className={classes.root}
      >
        <Card href={socialMedia.medium} variant="dual" component={A}>
          Read our latest articles <br /> on Medium
        </Card>

        <Card
          href="/contact-us"
          classes={{ root: classes.cardMargin }}
          variant="dual"
        >
          Contact Us
        </Card>
      </Grid>
    </Section>
  );
}

AboutWhereToNext.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    settings: PropTypes.shape({}).isRequired
  }).isRequired
};

export default withStyles(styles)(AboutWhereToNext);
