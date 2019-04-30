import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, MenuList, Link } from '@material-ui/core';

import classNames from 'classnames';

import activeContentIcon from '../assets/images/active-page.svg';

const styles = theme => ({
  root: {
    position: 'relative',
    display: 'flex',
    justifyContent: 'flex-start',
    width: '100%',
    height: '34rem',
    flexDirection: 'column',
    alignItems: 'flex-start',
    [theme.breakpoints.up('md')]: {
      position: 'fixed',
      width: '14.375rem'
    }
  },
  menuListRoot: {
    width: '14.188rem'
  },
  activeContentIndicator: {
    marginLeft: '-1.5rem',
    marginRight: '1rem'
  },
  listItem: {
    // Use padding instead of lineHeight: 2.39 in case a list item is too
    // long to fit one line
    padding: '0.625rem 0'
  },
  linkRoot: {
    fontWeight: 'bold'
  },
  activeLink: {
    textDecoration: 'underline'
  }
});

function TableOfContent({
  children,
  classes,
  content,
  current,
  generateHref,
  onChange
}) {
  return (
    <div className={classes.root}>
      {children}
      <MenuList classes={{ root: classes.menuListRoot }}>
        {content.map((c, index) => (
          <li key={generateHref(index)} className={classes.listItem}>
            <img
              alt=""
              src={activeContentIcon}
              className={classes.activeContentIndicator}
              hidden={current !== index}
            />
            <Link
              classes={{ root: classes.linkRoot }}
              className={classNames({
                [classes.activeLink]: current !== index
              })}
              href={generateHref(index)}
              color={current !== index ? 'primary' : 'textPrimary'}
              onClick={e => {
                e.preventDefault();

                window.history.pushState(null, '', generateHref(index));
                onChange(index);
              }}
              underline="none"
            >
              {c.title}
            </Link>
          </li>
        ))}
      </MenuList>
    </div>
  );
}

TableOfContent.propTypes = {
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]),
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  current: PropTypes.number.isRequired,
  generateHref: PropTypes.func.isRequired,
  onChange: PropTypes.func.isRequired
};

TableOfContent.defaultProps = {
  children: null
};

export default withStyles(styles)(TableOfContent);
