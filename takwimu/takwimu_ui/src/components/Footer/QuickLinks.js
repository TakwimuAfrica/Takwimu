import React from 'react';
import PropTypes from 'prop-types';

import classNames from 'classnames';

import { Link, Typography } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import Title from './Title';

const styles = theme => ({
  root: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '12.8125rem',
      paddingBottom: '0.5rem'
    }
  },
  text: {
    color: '#fff'
  },
  list: {
    listStyle: 'none',
    margin: '1.5rem 0 0 0',
    padding: 0
  },
  link: {
    fontSize: '0.9375rem'
  }
});

const LINKS = [
  { href: '#topic', label: 'Explore data by topic' },
  { href: '#analysis', label: 'Expert insights and analysis' },
  { href: '/about/', label: 'About Takwimu' },
  { href: '/about/', label: 'FAQs' },
  { href: '/contact-us', label: 'Contact Us' }
];
const LEGAL = [
  { href: '/legal', label: 'Terms of use' },
  { href: '/legal', label: 'Privacy Policy' }
];

function QuickLinks({ classes }) {
  const handleClick = clicked => {
    if (clicked === '#topic') {
      return window.toggleDrawer('topic')();
    }
    if (clicked === '#analysis') {
      return window.toggleDrawer('analysis')();
    }
    return null;
  };

  return (
    <div className={classes.root}>
      <Title>Quick Links</Title>
      <Typography
        variant="subtitle2"
        className={classNames([classes.text, classes.list])}
        component="ul"
      >
        {LINKS.map(link => (
          <li key={link.label}>
            <Link
              href={link.href}
              underline="always"
              className={classNames([classes.text, classes.link])}
              onClick={() => handleClick(link.href)}
            >
              {link.label}
            </Link>
          </li>
        ))}
      </Typography>
      <Typography
        variant="subtitle2"
        className={classNames([classes.text, classes.list])}
        component="ul"
      >
        {LEGAL.map(link => (
          <li key={link.label}>
            <Link
              href={link.href}
              className={classNames([classes.text, classes.link])}
              underline="always"
            >
              {link.label}
            </Link>
          </li>
        ))}
      </Typography>
    </div>
  );
}

QuickLinks.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(QuickLinks);
