import React from 'react';
import PropTypes from 'prop-types';

import { Typography } from '@material-ui/core';

import { withStyles } from '@material-ui/core/styles';
import Section from './Section';

const styles = () => ({
  videoWrapper: {
    position: 'relative',
    paddingBottom: '56.25%',
    paddingTop: '25px',
    marginTop: '25px',
    height: 0
  },
  youtubeIframe: {
    position: 'absolute',
    top: 0,
    left: 0,
    width: '100%',
    height: '100%'
  }
});

function MakingOfTakwimu({ classes }) {
  return (
    <Section title="The Making of Takwimu" variant="h3">
      <Typography variant="body1">
        Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor
        sit amet, consectetur adipiscing elit.
      </Typography>
      <div className={classes.videoWrapper}>
        <iframe
          className={classes.youtubeIframe}
          title="Making of Takwimu"
          width="560"
          height="315"
          src="https://www.youtube.com/embed/DvDCCETHsTo"
          frameBorder="0"
          allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
          allowFullScreen
        />
      </div>
    </Section>
  );
}

MakingOfTakwimu.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(MakingOfTakwimu);
