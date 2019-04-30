import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import ContentSection from '../ContentSection';
import Faq from './Faq';

const styles = () => ({
  root: {},
  contentGrid: { paddingTop: '2rem', paddingBottom: '2rem' }
});

function Faqs({ classes, faqs, ...props }) {
  return (
    <ContentSection
      title="Frequently Asked Questions"
      variant="h3"
      classes={{ root: classes.root }}
      component={ContentSection}
      {...props}
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
    </ContentSection>
  );
}

Faqs.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  faqs: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Faqs);
