import React from 'react';
import { PropTypes } from 'prop-types';

import { Typography, Card, CardContent, withStyles } from '@material-ui/core';

const styles = theme => ({
  box: {
    backgroundColor: theme.palette.primary.main,
    width: '100%',
    height: '11.875rem',
    margin: '0.8rem',
    borderRadius: '0',
    [theme.breakpoints.up('md')]: {
      width: '18.375rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '24.5rem'
    }
  },
  label: {
    textAlign: 'center',
    color: 'white',
    margin: '2em 1em',
    fontWeight: 'bold'
  }
});

function WhereToNextCard({ classes, title }) {
  return (
    <Card className={classes.box}>
      <CardContent style={{ margin: '0 auto' }}>
        <Typography variant="body1" className={classes.label}>
          {title}
        </Typography>
      </CardContent>
    </Card>
  );
}

WhereToNextCard.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string
};

WhereToNextCard.defaultProps = {
  title: ''
};
export default withStyles(styles)(WhereToNextCard);
