import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import Section from '../Section';

const styles = theme => ({
  root: { flexGrow: 1 },
  link: {
    fontSize: theme.typography.body1.fontSize
  },
  contentGrid: { paddingTop: '2rem', paddingBottom: '2rem' }
});

function Services({ classes }) {
  return (
    <Section title="Services" variant="h3" className={classes.root}>
      <Typography variant="body1">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Cant find the answer
        you need?
      </Typography>
      <Grid>
        <Typography>Service number oner</Typography>
        <Typography variant="body1">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
          eiusmod tempor incididunt ut labore et dolore magna aliqua. Cant find
          the answer you need?
        </Typography>
      </Grid>
    </Section>
  );
}

Services.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Services);
