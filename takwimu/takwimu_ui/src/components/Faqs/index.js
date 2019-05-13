import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, Grid, Typography } from '@material-ui/core';

import ContentSection from '../ContentSection';
import Faq from './Faq';

const styles = theme => ({
  root: {},
  contentGrid: {
    paddingTop: '2rem',
    paddingBottom: '2rem',
    '& a': {
      color: theme.palette.primary.main
    }
  }
});

function Faqs({ classes, faqs: { value: faqs }, ...props }) {
  if (!faqs) {
    return null;
  }

  return (
    <ContentSection
      title={faqs.title}
      variant="h3"
      classes={{ root: classes.root }}
      {...props}
    >
      <Typography
        variant="body1"
        dangerouslySetInnerHTML={{
          __html: faqs.description
        }}
      />
      <Grid
        container
        className={classes.contentGrid}
        direction="column"
        justify="flex-start"
      >
        {faqs.faqs.map(faq => (
          <Faq expandTitle={faq.value.question} key={faq.value.question}>
            <Typography
              variant="body2"
              dangerouslySetInnerHTML={{
                __html: faq.value.answer
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
  faqs: PropTypes.shape({
    value: PropTypes.shape({
      title: PropTypes.string,
      description: PropTypes.string,
      faqs: PropTypes.arrayOf(
        PropTypes.shape({
          value: PropTypes.shape({
            question: PropTypes.string,
            answer: PropTypes.string
          })
        })
      )
    })
  }).isRequired
};

export default withStyles(styles)(Faqs);
