import React from 'react';
import PropTypes from 'prop-types';

import { Link, Tabs, Tab } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import Layout from '../Layout';

const styles = theme => ({
  layoutRoot: {
    margin: '0 auto'
  },
  root: {
    display: 'flex',
    alignItems: 'center',
    width: '100%',
    height: '6.25rem', // 100px / 16
    backgroundColor: '#f6f6f6',
    scrollBehavior: 'smooth'
  },
  indicator: {
    display: 'none'
  },
  tab: {
    fontSize: '1.0625rem', // 17px
    textTransform: 'none',
    padding: '0.6875rem 1rem 0.6875rem 1.125rem',
    [theme.breakpoints.up('md')]: {
      minWidth: 0
    },
    '&$tabSelected': {
      backgroundColor: '#fff',
      borderRadius: 21.5
    }
  },
  tabSelected: {
    fontWeight: 700
  }
});

function LinkTab(props) {
  return <Tab component={Link} {...props} />;
}

function ProfileTabs({ classes, handleChange, tabs, value }) {
  return (
    <div className={classes.root}>
      <Layout classes={{ root: classes.layoutRoot }}>
        <Tabs
          classes={{ indicator: classes.indicator }}
          onChange={handleChange}
          value={value}
          variant="scrollable"
          scrollButtons="false"
        >
          {tabs.map((tab, index) => (
            <LinkTab
              key={tab.href}
              value={index}
              href="#takwimuProfile" // Always show the tabs on click
              label={tab.name}
              className={classes.tab}
              classes={{
                selected: classes.tabSelected
              }}
              underline="none"
            />
          ))}
        </Tabs>
      </Layout>
    </div>
  );
}

ProfileTabs.propTypes = {
  classes: PropTypes.shape().isRequired,
  handleChange: PropTypes.func,
  tabs: PropTypes.arrayOf(
    PropTypes.shape({
      name: PropTypes.string.isRequired,
      href: PropTypes.string.isRequired
    })
  ).isRequired,
  value: PropTypes.number.isRequired
};

ProfileTabs.defaultProps = {
  handleChange: null
};

export default withStyles(styles)(ProfileTabs);
