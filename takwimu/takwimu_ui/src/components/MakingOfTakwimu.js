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
  return (
    <Section title={title} variant="h3">
      <Typography
        variant="body1"
        dangerouslySetInnerHTML={{
          __html: description
        }}
      />
      <div className={classes.container}>
        <iframe
          title={title}
          src={link}
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
