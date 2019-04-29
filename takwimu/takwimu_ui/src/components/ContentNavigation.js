import React from 'react';

import { Link, Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import classNames from 'classnames';

import ContentSection from './ContentSection';

const styles = theme => ({
  root: {
    backgroundColor: theme.palette.info.main,
    padding: '1.125rem 1.625rem'
  },
  topicLinks: {
    '& > button:nth-child(n)': {
      marginRight: '3.125rem'
    }
  },
  topic: {
    color: theme.palette.primary.main,
    textDecoration: 'underline'
  },
  topicSelected: {},
  label: {
    color: '#848484',
    fontSize: '0.813rem',
    marginBottom: '1rem'
  }
});

function ContentNavigation({
  classes,
  title,
  contentTitle,
  current,
  content,
  generateHref,
  generateTitle,
  onClick,
  ...props
}) {
  return (
    <ContentSection classes={{ root: classes.root }} {...props}>
      <Typography className={classes.label}>
        {title} {contentTitle && <strong> {contentTitle}</strong>}
      </Typography>

      <div className={classes.topicLinks}>
        {content.map((c, index) => (
          <Link
            key={generateHref(index)}
            href={generateHref(index)}
            component="button"
            variant="body2"
            color={current === index ? 'textPrimary' : 'primary'}
            className={classNames({
              [classes.topic]: current !== index
            })}
            onClick={onClick(index)}
          >
            {generateTitle(index)}
          </Link>
        ))}
      </div>
    </ContentSection>
  );
}

ContentNavigation.propTypes = {
  title: PropTypes.string.isRequired,
  contentTitle: PropTypes.string,
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  current: PropTypes.number.isRequired,
  generateHref: PropTypes.func.isRequired,
  generateTitle: PropTypes.func.isRequired,
  onClick: PropTypes.func.isRequired
};

ContentNavigation.defaultProps = {
  contentTitle: ''
};

export default withStyles(styles)(ContentNavigation);
