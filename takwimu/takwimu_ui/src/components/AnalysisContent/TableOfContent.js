import React from 'react';
import PropTypes from 'prop-types';
import { withStyles, MenuList, Link } from '@material-ui/core';

import classNames from 'classnames';

import { CountrySelector } from '../ProfileDetail';

import activePageIcon from '../../assets/images/active-page.svg';

const styles = theme => ({
  root: {
    position: 'relative',
    display: 'flex',
    justifyContent: 'flex-start',
    width: '100%',
    height: '34rem',
    padding: '1.438rem 1.438rem 1.438rem 0',
    flexDirection: 'column',
    alignItems: 'flex-start',
    [theme.breakpoints.up('md')]: {
      position: 'fixed',
      width: '14.375rem'
    }
  },
  activePageIndicator: {
    marginLeft: '-1.5rem',
    marginRight: '1rem'
  },
  listItem: {
    decorator: 'none',
    padding: '0.625rem 0'
  },
  activeLink: {
    textDecoration: 'underline'
  }
});

function AnalysisTableOfContent({
  classes,
  content,
  current,
  country,
  onChangeContent
}) {
  return (
    <div className={classes.root}>
      <CountrySelector country={country} context="analysis" />
      <MenuList style={{ width: '14.188rem' }}>
        {content.map((c, index) => (
          <li className={classes.listItem}>
            <img
              alt=""
              src={activePageIcon}
              className={classes.activePageIndicator}
              hidden={current !== index}
            />
            <Link
              className={classNames({
                [classes.activeLink]: current !== index
              })}
              href={`#${index}`}
              color={current !== index ? 'primary' : 'textPrimary'}
              onClick={e => {
                e.preventDefault();
                onChangeContent(index);
              }}
            >
              {c.title}
            </Link>
          </li>
        ))}
      </MenuList>
    </div>
  );
}

AnalysisTableOfContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.shape({}).isRequired,
  current: PropTypes.number.isRequired,
  country: PropTypes.shape({}).isRequired,
  onChangeContent: PropTypes.func.isRequired
};

export default withStyles(styles)(AnalysisTableOfContent);
