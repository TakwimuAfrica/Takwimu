import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import Section from '../Section';

const styles = theme => ({
  root: {
    flexGrow: 1,
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '44.671875rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '59.5625rem'
    }
  },
  serviceHeading: {
    fontWeight: 'bold',
    paddingTop: '2rem',
    paddingBottom: '1rem'
  },
  contentGrid: {
    paddingTop: '1rem'
  }
});

function Services({ classes, services }) {
  return (
    <Section title="Services" variant="h3" classes={{ root: classes.root }}>
      <Typography variant="body1">{services.overview}</Typography>
      <Grid className={classes.contentGrid}>
        {services.servicesList.map(service => (
          <React.Fragment key={service.title}>
            <Typography
              variant="subtitle2"
              className={classes.serviceHeading}
              dangerouslySetInnerHTML={{
                __html: service.title
              }}
            />
            <Typography
              variant="body1"
              dangerouslySetInnerHTML={{
                __html: service.description
              }}
            />
          </React.Fragment>
        ))}
      </Grid>
    </Section>
  );
}

Services.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  services: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Services);
