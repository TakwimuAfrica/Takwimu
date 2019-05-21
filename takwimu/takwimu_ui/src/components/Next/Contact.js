import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Grid } from '@material-ui/core';

import A from '../A';
import Card from './Card';
import Section from '../Section';

const styles = theme => ({
  sectionRoot: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '44.671875rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '59.5625rem'
    }
  },
  root: {
    flexGrow: 1,
    paddingBottom: '2.25rem'
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
    }
  }
});
function ContactWhereToNext({ classes, socialMedia }) {
  return (
    <Section
      title="Where to next..."
      variant="h3"
      classes={{ root: classes.sectionRoot }}
    >
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
          href="/about/"
          classes={{ root: classes.cardMargin }}
          variant="dual"
        >
          About Us
        </Card>
      </Grid>
    </Section>
  );
}

ContactWhereToNext.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  socialMedia: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(ContactWhereToNext);
