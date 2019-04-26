import React from 'react';
import PropTypes from 'prop-types';

import { withStyles, Typography } from '@material-ui/core';

import Section from './Section';

const styles = () => ({
  root: {}
});

function RichTextSection({
  classes,
  component,
  title,
  value,
  variant,
  ...props
}) {
  const text = (
    <Typography
      variant="body1"
      dangerouslySetInnerHTML={{
        __html: value
      }}
    />
  );
  return React.createElement(
    component,
    {
      title,
      variant,
      classes: { root: classes.root },
      ...props
    },
    text
  );
}

RichTextSection.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  component: PropTypes.elementType,
  title: PropTypes.string.isRequired,
  value: PropTypes.string.isRequired,
  variant: PropTypes.string
};

RichTextSection.defaultProps = {
  variant: 'h3',
  component: Section
};

export default withStyles(styles)(RichTextSection);
