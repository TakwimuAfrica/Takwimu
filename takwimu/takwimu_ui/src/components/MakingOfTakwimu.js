import React from 'react';

import { Typography } from '@material-ui/core';

import Section from './Section';

function MakingOfTakwimu() {
  const styles = {
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
  };
  return (
    <Section title="The Making of Takwimu" variant="h3">
      <Typography variant="body1">
        Lorem ipsum dolor sit amet, adipiscing elitauris con lorem ipsum dolor
        sit amet, consectetur adipiscing elit.
      </Typography>
      <div style={styles.videoWrapper}>
        <iframe
          style={styles.youtubeIframe}
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

export default MakingOfTakwimu;
