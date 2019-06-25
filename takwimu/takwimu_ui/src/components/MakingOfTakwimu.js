import React, { useEffect } from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core/styles';

import { RichTypography } from './core';
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
  },
  title: {
    marginTop: '4.125rem'
  }
});

function MakingOfTakwimu({
  classes,
  takwimu: {
    page: {
      making_of_takwimu: { value: makingOf }
    }
  }
}) {
  if (!makingOf) {
    return null;
  }
  const { title, description, link } = makingOf;
  const iframeId = 'making-of-takwimu-yt-iframe';

  useEffect(() => {
    const tag = document.createElement('script');
    tag.id = 'making-of-takwimu-yt-iframe_api';
    tag.src = 'https://www.youtube.com/iframe_api';
    const firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    window.onYouTubeIframeAPIReady = () => {
      // eslint-disable-next-line no-new
      new window.YT.Player(iframeId, {
        events: {
          onStateChange: () => {
            window.ga('send', 'event', 'Video', 'Play', `${title}: ${link}`);
          }
        }
      });
    };
  });

  return (
    <Section title={title} variant="h3" classes={{ title: classes.title }}>
      <RichTypography>{description}</RichTypography>
      <div className={classes.container}>
        <iframe
          id={iframeId}
          title={title}
          src={
            link.indexOf('?') === -1
              ? `${link}?enablejsapi=1`
              : `${link}enablejsapi=1`
          }
          allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"
          allowFullScreen
          className={classes.iframe}
        />
      </div>
    </Section>
  );
}

MakingOfTakwimu.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    page: PropTypes.shape({
      making_of_takwimu: PropTypes.shape({
        value: PropTypes.shape({
          title: PropTypes.string.isRequired,
          description: PropTypes.string.isRequired,
          link: PropTypes.string.isRequired
        })
      }).isRequired
    }).isRequired
  }).isRequired
};

export default withStyles(styles)(MakingOfTakwimu);
