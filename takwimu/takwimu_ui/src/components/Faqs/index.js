import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import ContentSection from '../ContentSection';
import Faq from './Faq';
import RichTextSection from '../RichTextSection';

const styles = () => ({
  root: {},
  contentGrid: { paddingTop: '2rem', paddingBottom: '2rem' }
});

function Faqs({ classes, faqs, ...props }) {
  return (
    <RichTextSection
      title="Frequently Asked Questions"
      value={faqs.overview}
      variant="h3"
      classes={{ root: classes.root }}
      component={ContentSection}
      {...props}
    >
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
    </RichTextSection>
  );
}

Faqs.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  faqs: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(Faqs);
