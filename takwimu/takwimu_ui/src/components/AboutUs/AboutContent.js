import React from 'react';
import { Grid, Typography, withStyles, ButtonBase } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import classNames from 'classnames';

const styles = {
  root: {
    maxWidth: '933px'
  },
  title: {
    margin: '37px 0 22px 19px'
  },
  body: {
    padding: '0 19px'
  }
};

function AboutContent({ classes, activeContent, content }) {
  return (
    <React.Fragment>
      <div className={classes.root}>
        <Typography className={classes.title} variant="h2">
          About Us
        </Typography>
        <Grid>
          <Typography className={classes.label}>On this page</Typography>
          <div className={classes.otherTopicLinks}>
            {content.body.map(c => (
              <ButtonBase
                className={classNames({
                  [classes.otherTopic]: activeContent !== c.title
                })}
              >
                <Typography
                  variant="body2"
                  color={activeContent !== c.title ? 'textPrimary' : 'primary'}
                >
                  {c.title}
                </Typography>
              </ButtonBase>
            ))}
          </div>
        </Grid>
      </div>
    </React.Fragment>
  );
}

AboutContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  activeContent: PropTypes.string.isRequired,
  content: PropTypes.shape([]).isRequired
};

export default withStyles(styles)(AboutContent);
