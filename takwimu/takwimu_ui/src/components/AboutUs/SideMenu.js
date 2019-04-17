import React from 'react';
import PropTypes from 'prop-types';
import { Typography, MenuList, Link } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import classNames from 'classnames';
import activePageIcon from '../../assets/images/active-page.svg';

const styles = theme => ({
  sideMenuRoot: {
    position: 'relative',
    display: 'flex',
    justifyContent: 'flex-start',
    width: '100%',
    height: '34rem',
    padding: '1.438rem',
    flexDirection: 'column',
    alignItems: 'flex-start',
    [theme.breakpoints.up('md')]: {
      position: 'fixed',
      width: '14.375rem'
    }
  },
  sideMenuHeader: {
    fontColor: theme.palette.info.other
  },
  activePageIndicator: {
    marginLeft: '-1.5rem',
    marginRight: '1rem'
  },
  listItem: {
    decorator: 'none',
    padding: '0.625rem 0',
    fontWeight: 'bold'
  },
  activeLink: {
    textDecoration: 'underline'
  }
});

function SideMenu({ classes, content, activeContent }) {
  return (
    <div className={classes.sideMenuRoot}>
      <Typography variant="subtitle2" className={classes.sideMenuHeader}>
        Jump to:
      </Typography>
      <MenuList>
        {content.map(item => (
          <li classNames={classes.listItem}>
            <img
              alt=""
              src={activePageIcon}
              className={classes.activePageIndicator}
              hidden={item.link !== activeContent}
            />
            <Link
              className={classNames({
                [classes.activeLink]: item.link !== activeContent
              })}
              href="#$item.link"
            >
              {item.title}
            </Link>
          </li>
        ))}
      </MenuList>
    </div>
  );
}

SideMenu.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  activeContent: PropTypes.string.isRequired,
  content: PropTypes.shape([]).isRequired
};

export default withStyles(styles)(SideMenu);
