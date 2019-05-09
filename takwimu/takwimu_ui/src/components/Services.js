import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import ContentSection from './ContentSection';

const styles = theme => ({
  root: {},
  serviceHeading: {
    fontWeight: 'bold',
    paddingTop: '2rem',
    paddingBottom: '1rem'
  },
  contentGrid: {
    paddingTop: '1rem',
    '& a': {
      color: theme.palette.primary.main
    }
  }
});

function Services({ classes, services: { value: services }, ...props }) {
  if (!services) {
    return null;
  }

  return (
    <ContentSection
      title={services.title}
      variant="h3"
      classes={{ root: classes.root }}
      {...props}
    >
      <Typography
        variant="body1"
        dangerouslySetInnerHTML={{
          __html: services.overview
        }}
      />
      <Grid className={classes.contentGrid}>
        {services.services.map(service => (
          <React.Fragment key={service.value.title}>
            <Typography
              variant="subtitle2"
              className={classes.serviceHeading}
              dangerouslySetInnerHTML={{
                __html: service.value.title
              }}
            />
            <Typography
              variant="body1"
              dangerouslySetInnerHTML={{
                __html: service.value.description
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
  services: PropTypes.shape({
    value: PropTypes.shape({
      title: PropTypes.string,
      description: PropTypes.string,
      services: PropTypes.arrayOf(
        PropTypes.shape({
          value: PropTypes.shape({
            title: PropTypes.string,
            description: PropTypes.string
          })
        })
      )
    })
  }).isRequired
};

export default withStyles(styles)(Services);
