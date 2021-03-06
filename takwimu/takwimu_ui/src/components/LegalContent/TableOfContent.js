import React from 'react';
import PropTypes from 'prop-types';

import { Typography } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import TableOfContent from '../TableOfContent';

const styles = theme => ({
  root: {},
  sideMenuHeader: {
    color: theme.palette.info.other
  }
});

function LegalTableOfContent({
  classes,
  current,
  contentHeadings,
  changeActiveContent
}) {
  const generateHref = index => {
    const item = contentHeadings[index];
    return `/${item.link}`;
  };

  return (
    <TableOfContent
      classes={{ root: classes.root }}
      content={contentHeadings}
      current={current}
      generateHref={generateHref}
      onChange={changeActiveContent}
    >
      <Typography variant="subtitle2" className={classes.sideMenuHeader}>
        Jump to:
      </Typography>
    </TableOfContent>
  );
}

LegalTableOfContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  contentHeadings: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  changeActiveContent: PropTypes.func.isRequired
};

export default withStyles(styles)(LegalTableOfContent);
