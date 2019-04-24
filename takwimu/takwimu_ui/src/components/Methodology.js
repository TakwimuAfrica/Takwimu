import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import Section from './Section';

const styles = theme => ({
  root: {
    flexGrow: 1,
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '44.671875rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '59.5625rem'
    }
  },
  contentGrid: {
    paddingTop: '1rem'
  }
});

function Methodology({ classes, methodology }) {
  return (
    <Section title="Methodology" variant="h3" classes={{ root: classes.root }}>
      <Typography
        variant="body1"
        dangerouslySetInnerHTML={{
          __html: methodology
        }}
      />
      <Grid className={classes.contentGrid} />
    </Section>
  );
}

Methodology.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  methodology: PropTypes.string.isRequired
};

export default withStyles(styles)(Methodology);
