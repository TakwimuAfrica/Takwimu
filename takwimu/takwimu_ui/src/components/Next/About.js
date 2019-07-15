import React from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Grid } from '@material-ui/core';

import A from '../A';
import Card from './Card';
import ContentSection from '../ContentSection';

const styles = theme => ({
  sectionRoot: {
    padding: 0
  },
  root: {
    flexGrow: 1,
    paddingBottom: '2.25rem'
  },
  link: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: 'auto'
    }
  },
  cardMargin: {
    marginTop: '2rem',
    [theme.breakpoints.up('md')]: {
      marginTop: 0
    }
  }
});
function AboutWhereToNext({ classes, socialMedia, title }) {
  return (
    <ContentSection
      title={title}
      variant="h3"
      classes={{ root: classes.sectionRoot }}
    >
      <Grid
        container
        justify="space-between"
        alignItems="center"
        className={classes.root}
      >
        <Card href={socialMedia.medium} variant="dual" component={A}>
          Read our latest articles <br /> on Medium
        </Card>

        <Card
          href="/contact"
          classes={{ root: classes.cardMargin }}
          variant="dual"
        >
          Contact Us
        </Card>
      </Grid>
    </ContentSection>
  );
}

AboutWhereToNext.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  socialMedia: PropTypes.shape({}).isRequired,
  title: PropTypes.string
};

AboutWhereToNext.defaultProps = {
  title: 'Where to next...'
};

export default withStyles(styles)(AboutWhereToNext);
