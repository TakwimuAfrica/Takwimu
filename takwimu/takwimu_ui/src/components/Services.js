import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import ContentSection from './ContentSection';

const styles = () => ({
  root: {},
  serviceHeading: {
    fontWeight: 'bold',
    paddingTop: '2rem',
    paddingBottom: '1rem'
  },
  contentGrid: {
    paddingTop: '1rem'
  }
});

function Services({ classes, services, ...props }) {
  return (
    <ContentSection
      title="Services"
      variant="h3"
      classes={{ root: classes.root }}
      component={ContentSection}
      {...props}
    >
      <Typography
        variant="body1"
        dangerouslySetInnerHTML={{
          __html: services.overview
        }}
      />
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
    </ContentSection>
  );
}

Services.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  services: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Services);
