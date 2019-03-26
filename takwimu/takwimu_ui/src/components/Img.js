import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core/styles';

const styles = () => ({});

function Img({ alt, src, ...others }) {
  const file = src.slice(src.length - 4);
  const ext = src.slice(-4);
  return (
    file &&
    ext && (
      <img
        src={src}
        srcSet={`${file}@2x${ext} 2x, ${file}@3x${ext} 3x`}
        alt={alt}
        {...others}
      />
    )
  );
}

Img.propTypes = {
  src: PropTypes.string.isRequired,
  alt: PropTypes.string
};

Img.defaultProps = {
  alt: ''
};

export default withStyles(styles)(Img);
