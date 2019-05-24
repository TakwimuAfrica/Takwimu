import React from 'react';
import PropTypes from 'prop-types';

import classNames from 'classnames';

import { withStyles, Grid } from '@material-ui/core';

import ContentSection from './ContentSection';
import { RichTypography } from './core';

const styles = theme => ({
  root: {},
  serviceHeading: {
    fontWeight: 'bold',
    paddingTop: '2rem',
    paddingBottom: '1rem'
  },
  content: {
    '& a': {
      color: theme.palette.primary.main
    }
  },
  contentGrid: {
    paddingTop: '1rem'
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
      <RichTypography className={classes.content}>
        {services.description}
      </RichTypography>
      <Grid className={classNames(classes.content, classes.contentGrid)}>
        {services.services.map(({ value: service }) => (
          <React.Fragment key={service.title}>
            <RichTypography
              variant="subtitle2"
              className={classes.serviceHeading}
            >
              {service.title}
            </RichTypography>
            <RichTypography>{service.description}</RichTypography>
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
