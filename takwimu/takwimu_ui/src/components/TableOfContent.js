import React, { useState, useEffect } from 'react';
import PropTypes from 'prop-types';

import classNames from 'classnames';
import { withStyles, Link, MenuList } from '@material-ui/core';
import withWidth, { isWidthUp } from '@material-ui/core/withWidth';

import activeContentIcon from '../assets/images/active-page.svg';

const DEFAULT_TOP = 120; // Navigation height + padding
const styles = theme => ({
  root: {
    position: 'relative',
    display: 'flex',
    justifyContent: 'flex-start',
    width: '100%',
    flexDirection: 'column',
    alignItems: 'flex-start',
    [theme.breakpoints.up('md')]: {
      position: 'fixed',
      width: '14.375rem',
      top: `${DEFAULT_TOP}px`,
      bottom: 0,
      overflow: 'hidden auto',

      scrollbarColor: '#d3d3d3',
      scrollbarWidth: 'thin',
      '&::-webkit-scrollbar': {
        width: '0.4rem'
      },
      '&::-webkit-scrollbar-thumb': {
        backgroundColor: '#d3d3d3'
      },
      '&::-webkit-scrollbar-corner': {
        backgroundColor: 'transparent'
      }
    }
  },
  menuListRoot: {
    width: '14.188rem',
    paddingTop: '2rem'
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
  onChange,
  width
}) {
  const [scrollDistance, setScrollDistance] = useState(0);

  useEffect(() => {
    const calculateScrollDistance = () => {
      const footer = document.getElementById('takwimuFooter');
      const { top } = footer.getBoundingClientRect();
      if (top < window.innerHeight) {
        return window.innerHeight - top;
      }
      return 0;
    };

    function handleScroll() {
      setScrollDistance(calculateScrollDistance());
    }

    window.addEventListener('scroll', handleScroll);

    return () => {
      window.removeEventListener('scroll', handleScroll);
    };
  }, []);
  const y = isWidthUp('md', width) ? DEFAULT_TOP : 0;
  const top = `${y - scrollDistance}px`;
  const bottom = `${scrollDistance}px`;

  return (
    <div className={classes.root} style={{ top, bottom }}>
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
  onChange: PropTypes.func.isRequired,
  width: PropTypes.string.isRequired
};

TableOfContent.defaultProps = {
  children: null
};

export default withWidth()(withStyles(styles)(TableOfContent));
