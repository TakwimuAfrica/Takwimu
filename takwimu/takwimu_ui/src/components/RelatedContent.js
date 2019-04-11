import React from 'react';
import PropTypes from 'prop-types';

import { Grid, Typography, withStyles } from '@material-ui/core';

import Section from './Section';

const styles = theme => ({
  root: { flexGrow: 1 },
  link: {
    color: theme.palette.primary.main
  },
  linkGrid: { height: '18.456rem' }
});

function RelatedContent({ classes }) {
  return (
    <Section title="Related Content" variant="h3">
      <Grid
        container
        spacing={24}
        direction="row"
        justify="flex-start"
        alignItems="center"
      >
        <Grid item className={classes.linkGrid}>
          <ul>
            <a href="/" className={classes.link}>
              <li>
                <Typography variant="body2" className={classes.link}>
                  Lorem ipsom dolor sit amec
                </Typography>
              </li>
            </a>
            <a href="/" className={classes.link}>
              <li>
                <Typography variant="body2" className={classes.link}>
                  South Africa Data visuals for politics
                </Typography>
              </li>
            </a>
            <a href="/" className={classes.link}>
              <li>
                <Typography variant="body2" className={classes.link}>
                  Source 1 lorem ipsumo
                </Typography>
              </li>
            </a>
            <a href="/" className={classes.link}>
              <li>
                <Typography variant="body2" className={classes.link}>
                  Source 2 lorem ipsum dolor
                </Typography>
              </li>
            </a>
          </ul>
        </Grid>

        <Grid item className={classes.linkGrid}>
          <ul>
            <a href="/" className={classes.link}>
              <li>
                <Typography variant="body2" className={classes.link}>
                  Lorem ipsom dolor sit amec
                </Typography>
              </li>
            </a>
            <a href="/" className={classes.link}>
              <li>
                <Typography variant="body2" className={classes.link}>
                  South Africa Data visuals for politics
                </Typography>
              </li>
            </a>
          </ul>
        </Grid>
      </Grid>
    </Section>
  );
}

RelatedContent.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(RelatedContent);
