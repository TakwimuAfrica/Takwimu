import React from 'react';
import PropTypes from 'prop-types';

import { Link, Typography } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

const styles = theme => ({
  root: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '12.8125rem'
    }
  },
  title: {
    color: 'white',
    fontWeight: 800
  },
  text: {
    marginTop: '2.3125rem',
    color: 'white',
    // fontWeight: 800
    listStyle: 'none',
    margin: 0,
    padding: 0
  }
});

const LINKS = [
  'Explore data by topic',
  'Explore data by topic',
  'Expert insights and analysis',
  'About Takwimu',
  'FAQs',
  'Contact Us'
];
const TERMS = ['Terms of use', 'Privacy Policy'];
function QuickLinks({ classes }) {
  return (
    <div className={classes.root}>
      <Typography variant="button" className={classes.title}>
        Quick Links
      </Typography>
      <Typography variant="button" className={classes.text} component="ul">
        {LINKS.map(link => (
          <li>
            <Link
              key={link}
              href="/about"
              className={classes.text}
              underline="always"
            >
              {link}
            </Link>
          </li>
        ))}
      </Typography>
      <Typography variant="button" className={classes.text} component="ul">
        {TERMS.map(link => (
          <li>
            <Link
              key={link}
              href="/about"
              className={classes.text}
              underline="always"
            >
              {link}
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
