import React from 'react';
import PropTypes from 'prop-types';
import {
  Grid,
  Typography,
  withStyles,
  ExpansionPanelDetails
} from '@material-ui/core';

import Section from '../Section';
import ExpansionPanelContent from './ExpansionPanelContent';

const styles = theme => ({
  root: { flexGrow: 1 },
  panelDetails: { backgroundColor: theme.palette.info.main }
});

function FAQ({ classes }) {
  return (
    <Section title="Frequently Asked Question" className={classes.root}>
      <Typography variant="body1">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Cant find the answer
        you need? <a href="/">Get in touch with us</a>
      </Typography>
      <Grid
        container
        style={{ paddingTop: '1.5rem', paddingBottom: '1.5rem' }}
        direction="column"
        justify="flex-start"
        alignItems="center"
      >
        <ExpansionPanelContent
          style={{ padding: '1rem' }}
          expandTitle="Where is the data sourced from? "
        >
          <ExpansionPanelDetails className={classes.panelDetails}>
            <Typography varian="body1">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
              et lorem eros. Integer vel venenatis urna. Nam vestibulum felis
              vitae scelerisque imperdiet. Nulla nisl libero, vestibulum eu
              lorem at, consequat finibus libero. Ut tincidunt rutrum purus
              vitae interdum. Phasellus efficitur tincidunt lorem ut blandit.
            </Typography>
          </ExpansionPanelDetails>
        </ExpansionPanelContent>

        <ExpansionPanelContent expandTitle="How often is the data reviewed and updated? ">
          <ExpansionPanelDetails className={classes.panelDetails}>
            <Typography varian="body1">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
              et lorem eros. Integer vel venenatis urna. Nam vestibulum felis
              vitae scelerisque imperdiet. Nulla nisl libero, vestibulum eu
              lorem at, consequat finibus libero. Ut tincidunt rutrum purus
              vitae interdum. Phasellus efficitur tincidunt lorem ut blandit.
            </Typography>
          </ExpansionPanelDetails>
        </ExpansionPanelContent>
        <ExpansionPanelContent expandTitle="Is this another question that might be asked? ">
          <ExpansionPanelDetails className={classes.panelDetails}>
            <Typography varian="body1">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
              et lorem eros. Integer vel venenatis urna. Nam vestibulum felis
              vitae scelerisque imperdiet. Nulla nisl libero, vestibulum eu
              lorem at, consequat finibus libero. Ut tincidunt rutrum purus
              vitae interdum. Phasellus efficitur tincidunt lorem ut blandit.
            </Typography>
          </ExpansionPanelDetails>
        </ExpansionPanelContent>
        <ExpansionPanelContent expandTitle="Is this another question that might be asked? ">
          <ExpansionPanelDetails className={classes.panelDetails}>
            <Typography varian="body1">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
              et lorem eros. Integer vel venenatis urna. Nam vestibulum felis
              vitae scelerisque imperdiet. Nulla nisl libero, vestibulum eu
              lorem at, consequat finibus libero. Ut tincidunt rutrum purus
              vitae interdum. Phasellus efficitur tincidunt lorem ut blandit.
            </Typography>
          </ExpansionPanelDetails>
        </ExpansionPanelContent>
        <ExpansionPanelContent expandTitle="Is this another question that might be asked? ">
          <ExpansionPanelDetails className={classes.panelDetails}>
            <Typography varian="body1">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
              et lorem eros. Integer vel venenatis urna. Nam vestibulum felis
              vitae scelerisque imperdiet. Nulla nisl libero, vestibulum eu
              lorem at, consequat finibus libero. Ut tincidunt rutrum purus
              vitae interdum. Phasellus efficitur tincidunt lorem ut blandit.
            </Typography>
          </ExpansionPanelDetails>
        </ExpansionPanelContent>
        <ExpansionPanelContent expandTitle="Is this another question that might be asked? ">
          <ExpansionPanelDetails className={classes.panelDetails}>
            <Typography varian="body1">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer
              et lorem eros. Integer vel venenatis urna. Nam vestibulum felis
              vitae scelerisque imperdiet. Nulla nisl libero, vestibulum eu
              lorem at, consequat finibus libero. Ut tincidunt rutrum purus
              vitae interdum. Phasellus efficitur tincidunt lorem ut blandit.
            </Typography>
          </ExpansionPanelDetails>
        </ExpansionPanelContent>
      </Grid>
    </Section>
  );
}

FAQ.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(FAQ);
