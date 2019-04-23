import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import Section from '../Section';
import Faq from './Faq';

const styles = {
  root: { flexGrow: 1 },
  contentGrid: { paddingTop: '2rem', paddingBottom: '2rem' }
};

function Faqs({ classes, takwimu: { faqs } }) {
  return (
    <Section
      title="Frequently Asked Questions"
      variant="h3"
      className={classes.root}
    >
      <Typography
        variant="body1"
        dangerouslySetInnerHTML={{
          __html: faqs.overview
        }}
      />
      <Grid
        container
        className={classes.contentGrid}
        direction="column"
        justify="flex-start"
      >
        {faqs.faqsList.map(faq => (
          <Faq expandTitle={faq.question} key={faq.question}>
            <Typography
              variant="body2"
              dangerouslySetInnerHTML={{
                __html: faq.answer
              }}
            />
          </Faq>
        ))}
      </Grid>
    </Section>
  );
}

Faqs.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({
    faqs: PropTypes.shape({}).isRequired
  }).isRequired
};

export default withStyles(styles)(Faqs);
