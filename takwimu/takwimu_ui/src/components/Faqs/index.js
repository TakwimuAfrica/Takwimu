import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Link, Typography } from '@material-ui/core';

import Section from '../Section';
import Faq from './Faq';

const styles = theme => ({
  root: { flexGrow: 1 },
  link: {
    fontSize: theme.typography.body1.fontSize
  },
  contentGrid: { paddingTop: '2rem', paddingBottom: '2rem' }
});

function Faqs({ classes }) {
  return (
    <Section
      title="Frequently Asked Questions"
      variant="h3"
      className={classes.root}
    >
      <Typography variant="body1">
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod
        tempor incididunt ut labore et dolore magna aliqua. Cant find the answer
        you need?{' '}
        <Link href="/contact-us" underline="always" className={classes.link}>
          Get in touch with us
        </Link>
      </Typography>
      <Grid
        container
        className={classes.contentGrid}
        direction="column"
        justify="flex-start"
        alignItems="center"
      >
        <Faq expandTitle="Where is the data sourced from? ">
          <Typography variant="body2">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et
            lorem eros. Integer vel venenatis urna. Nam vestibulum felis vitae
            scelerisque imperdiet. Nulla nisl libero, vestibulum eu lorem at,
            consequat finibus libero. Ut tincidunt rutrum purus vitae interdum.
            Phasellus efficitur tincidunt lorem ut blandit.
          </Typography>
        </Faq>

        <Faq expandTitle="How often is the data reviewed and updated? ">
          <Typography variant="body2">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et
            lorem eros. Integer vel venenatis urna. Nam vestibulum felis vitae
            scelerisque imperdiet. Nulla nisl libero, vestibulum eu lorem at,
            consequat finibus libero. Ut tincidunt rutrum purus vitae interdum.
            Phasellus efficitur tincidunt lorem ut blandit.
          </Typography>
        </Faq>

        <Faq expandTitle="Is this another question that might be asked? ">
          <Typography variant="body2">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et
            lorem eros. Integer vel venenatis urna. Nam vestibulum felis vitae
            scelerisque imperdiet. Nulla nisl libero, vestibulum eu lorem at,
            consequat finibus libero. Ut tincidunt rutrum purus vitae interdum.
            Phasellus efficitur tincidunt lorem ut blandit.
          </Typography>
        </Faq>

        <Faq expandTitle="Is this another question that might be asked? ">
          <Typography variant="body2">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et
            lorem eros. Integer vel venenatis urna. Nam vestibulum felis vitae
            scelerisque imperdiet. Nulla nisl libero, vestibulum eu lorem at,
            consequat finibus libero. Ut tincidunt rutrum purus vitae interdum.
            Phasellus efficitur tincidunt lorem ut blandit.
          </Typography>
        </Faq>

        <Faq expandTitle="Is this another question that might be asked? ">
          <Typography variant="body2">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et
            lorem eros. Integer vel venenatis urna. Nam vestibulum felis vitae
            scelerisque imperdiet. Nulla nisl libero, vestibulum eu lorem at,
            consequat finibus libero. Ut tincidunt rutrum purus vitae interdum.
            Phasellus efficitur tincidunt lorem ut blandit.
          </Typography>
        </Faq>

        <Faq expandTitle="Is this another question that might be asked? ">
          <Typography variant="body2">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et
            lorem eros. Integer vel venenatis urna. Nam vestibulum felis vitae
            scelerisque imperdiet. Nulla nisl libero, vestibulum eu lorem at,
            consequat finibus libero. Ut tincidunt rutrum purus vitae interdum.
            Phasellus efficitur tincidunt lorem ut blandit.
          </Typography>
        </Faq>
      </Grid>
    </Section>
  );
}

Faqs.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Faqs);
