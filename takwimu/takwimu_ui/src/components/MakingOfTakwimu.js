import React from 'react';
import PropTypes from 'prop-types';

import { Typography } from '@material-ui/core';

import { withStyles } from '@material-ui/core/styles';
import Section from './Section';

const styles = () => ({
  container: {
    position: 'relative',
    paddingBottom: '56.25%',
    margin: '2.8125rem 0'
  },
  iframe: {
    position: 'absolute',
    top: 0,
    left: 0,
    width: '100%',
    height: '100%',
    border: 0
  }
});

function MakingOfTakwimu({ classes }) {
  return (
    <Section title="The Making of Takwimu" variant="h3">
      <Typography variant="body1">
        Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor
        sit amet, consectetur adipiscing elit.
      </Typography>
      <div className={classes.container}>
        <iframe
          title="making takwimu"
          src="https://www.youtube-nocookie.com/embed/DvDCCETHsTo"
          allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"
          allowFullScreen
          className={classes.iframe}
        />
      </div>
    </Section>
  );
}

MakingOfTakwimu.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(MakingOfTakwimu);
