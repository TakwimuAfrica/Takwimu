import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import Section from './Section';
import { RichTypography } from './core';

const styles = () => ({
  root: {},
  text: {}
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
    <RichTypography classes={{ root: classes.text }}>{value}</RichTypography>
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
