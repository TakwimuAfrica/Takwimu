import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core';

import { CountrySelector } from '../ProfileDetail';
import TableOfContent from '../TableOfContent';

const styles = theme => ({
  root: {},
  countrySelectorLabel: {
    fontSize: theme.typography.caption.fontSize
  }
});

function AnalysisTableOfContent({
  classes,
  content,
  current,
  country,
  onChangeContent
}) {
  const { slug: countrySlug } = country;
  const generateHref = index => {
    const analysisUrl = `/profiles/${countrySlug}`;
    if (content[index].meta.slug === countrySlug) {
      return analysisUrl;
    }
    return `${analysisUrl}/${content[index].meta.slug}`;
  };

  return (
    <TableOfContent
      classes={{ root: classes.root }}
      content={content}
      current={current}
      generateHref={generateHref}
      onChange={onChangeContent}
    >
      <CountrySelector
        country={country}
        context="analysis"
        classes={{ label: classes.countrySelectorLabel }}
      />
    </TableOfContent>
  );
}

AnalysisTableOfContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  current: PropTypes.number.isRequired,
  country: PropTypes.shape({}).isRequired,
  onChangeContent: PropTypes.func.isRequired
};

export default withStyles(styles)(AnalysisTableOfContent);
