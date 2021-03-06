import React from 'react';
import { PropTypes } from 'prop-types';

import classNames from 'classnames';

import { withStyles, Grid } from '@material-ui/core';

import Card from './Card';
import Section from '../Section';

const styles = theme => ({
  root: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '100%'
    },
    [theme.breakpoints.up('lg')]: {
      width: '100%'
    }
  },
  container: {
    flexGrow: 1,
    paddingBottom: '6.25rem'
  },
  cardMargin: {
    marginTop: '2rem',
    [theme.breakpoints.up('md')]: {
      marginTop: 0,
      marginLeft: '1.734375rem' // .75 of lg
    }
  }
});

function AnalysisReadNext({ classes, current, content, showContent, title }) {
  const hasContent = current < content.body.length - 1;

  return hasContent ? (
    <Section classes={{ root: classes.root }} title={title} variant="h3">
      <Grid
        container
        justify="flex-start"
        alignItems="center"
        className={classes.container}
      >
        {content.body.map((c, index) =>
          index > current && index - current <= 2 ? (
            <Card
              key={c.id}
              variant="dual"
              classes={{
                root: classNames({ [classes.cardMargin]: index - current > 1 })
              }}
              onClick={showContent(index)}
            >
              {c.value.title}
            </Card>
          ) : null
        )}
      </Grid>
    </Section>
  ) : null;
}

AnalysisReadNext.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string.isRequired,
  current: PropTypes.number.isRequired,
  content: PropTypes.shape({}).isRequired,
  showContent: PropTypes.func.isRequired
};

export default withStyles(styles)(AnalysisReadNext);
