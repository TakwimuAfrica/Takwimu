import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import Section from '../Section';

const styles = {
  root: {
    flexGrow: 1
  },
  serviceHeading: {
    fontWeight: 'bold',
    paddingTop: '2rem',
    paddingBottom: '1rem'
  },
  contentGrid: {
    paddingTop: '1rem'
  }
};

function Services(props) {
  const {
    classes,
    takwimu: { services }
  } = props;
  return (
    <Section title="Services" variant="h3" className={classes.root}>
      <Typography variant="body1">{services.overview}</Typography>
      <Grid className={classes.contentGrid}>
        {services.servicesList.map(service => (
          <React.Fragment>
            <Typography variant="subtitle2" className={classes.serviceHeading}>
              {service.title}
            </Typography>
            <Typography variant="body1">
              {service.description.replace(
                /<br\/>|<p>|<\/div>|<div class="rich-text">|<\/p>/gi,
                ''
              )}
            </Typography>
          </React.Fragment>
        ))}
      </Grid>
    </Section>
  );
}

Services.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    services: PropTypes.shape({}).isRequired
  }).isRequired
};

export default withStyles(styles)(Services);
