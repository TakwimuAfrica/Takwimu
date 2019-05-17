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
    '& > a:nth-child(n)': {
      lineHeight: 1.5,
      marginRight: '1.125rem'
    }
  },
  topic: {
    textDecoration: 'underline'
  },
  topicSelected: {},
  label: {
    fontSize: '0.813rem',
    marginBottom: '1rem'
  },
  other: {
    color: '#848484'
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
  linksPrimaryColor,
  linksSecondaryColor,
  ...props
}) {
  return (
    <ContentSection classes={{ root: classes.root }} {...props}>
      <Typography className={classes.label}>
        <span className={classes.other}>{title} </span>{' '}
        {contentTitle && <strong> {contentTitle}</strong>}
      </Typography>

      <div className={classes.topicLinks}>
        {content.map((c, index) => (
          <Link
            key={generateHref(index)}
            href={generateHref(index)}
            variant="body2"
            color={current === index ? linksSecondaryColor : linksPrimaryColor}
            className={classNames({
              [classes.topic]: current !== index
            })}
            onClick={e => onClick(e, index)}
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
  onClick: PropTypes.func.isRequired,
  linksPrimaryColor: PropTypes.string,
  linksSecondaryColor: PropTypes.string
};

ContentNavigation.defaultProps = {
  contentTitle: '',
  linksPrimaryColor: 'primary',
  linksSecondaryColor: 'textPrimary'
};

export default withStyles(styles)(ContentNavigation);
