import React from 'react';
import PropTypes from 'prop-types';

import { AppBar, Tabs, Tab, withStyles } from '@material-ui/core';
import withWidth, { isWidthUp } from '@material-ui/core/withWidth';

import KeyboardArrowDown from '@material-ui/icons/KeyboardArrowDown';
import KeyboardArrowUp from '@material-ui/icons/KeyboardArrowUp';
import Layout from './Layout';

const styles = theme => ({
  root: {
    flexGrow: 1,
    scrollBehavior: 'smooth',
    display: 'flex',
    justifyContent: 'space-evenly',
    backgroundColor: theme.palette.background.lightGray
  },
  appbar: {
    boxShadow: 'none',
    paddingTop: theme.spacing.unit * 3.125,
    paddingBottom: theme.spacing.unit * 3.125,
    backgroundColor: theme.palette.background.lightGray
  },
  indicator: {
    height: 0
  },
  tabsRoot: {
    minHeight: '2.6875rem'
  },
  tab: {
    fontFamily: theme.typography.body3.fontFamily,
    fontSize: theme.typography.body3.fontSize,
    fontWeight: theme.typography.body3.fontWeight,
    textTransform: 'none',
    [theme.breakpoints.up('md')]: {
      minWidth: 0
    }
  },
  tabSelected: {
    fontWeight: 700,
    backgroundColor: theme.palette.secondary.main,
    borderRadius: '1.344rem'
  },
  wrapper: {
    display: 'inline-block'
  },
  KeyboardArrow: {
    float: 'right',
    marginLeft: -theme.spacing.unit * 2
  },
  labelIcon: {
    paddingTop: 0
  },
  textColorInherit: {
    opacity: 1
  }
});

const TABS = [
  {
    name: 'All',
    href: '#profile-detail'
  },
  {
    name: 'Elections',
    href: '#elections'
  },
  {
    name: 'Demographics',
    href: '#demographics'
  },
  {
    name: 'Households',
    href: '#households'
  },
  {
    name: 'Employment',
    href: '#employment'
  },
  {
    name: 'Crime Reports',
    href: '#crime-reports'
  },
  {
    name: 'Education',
    href: '#education'
  },
  {
    name: 'Health',
    href: '#health'
  },
  {
    name: 'Nutrition',
    href: '#nutrition'
  }
];

function LinkTab(props) {
  return <Tab component="a" {...props} />;
}

class ProfileTabs extends React.Component {
  constructor(props) {
    super(props);

    const { tabs } = props;
    let value;
    if (tabs.length) {
      const [{ href }] = tabs;
      value = href;
    }
    this.state = { value, isSDGActive: false };
    this.handleChange = this.handleChange.bind(this);
    this.handleSDGClick = this.handleSDGClick.bind(this);
  }

  handleChange(event, value) {
    this.setState({ value });
  }

  handleSDGClick() {
    this.setState(prevState => ({ isSDGActive: !prevState.isSDGActive }));
  }

  render() {
    const { classes, tabs, width } = this.props;
    const { value, isSDGActive } = this.state;

    const centered = isWidthUp('md', width); // centered is only for md and up
    const variant = centered ? 'standard' : 'scrollable';

    return (
      <div className={classes.root}>
        <Layout>
          <AppBar color="inherit" position="static" className={classes.appbar}>
            <Tabs
              value={value}
              variant={variant}
              scrollButtons="off" // Never show scroll buttons
              classes={{ root: classes.tabsRoot, indicator: classes.indicator }}
              onChange={this.handleChange}
            >
              {tabs.map(tab => (
                <LinkTab
                  key={tab.href}
                  value={tab.href}
                  href={tab.href}
                  label={tab.name}
                  className={classes.tab}
                  hasDropdown
                  classes={{
                    selected: classes.tabSelected,
                    root: classes.tabsRoot,
                    textColorInherit: classes.textColorInherit
                  }}
                />
              ))}
              <Tab
                component="button"
                onClick={() => {
                  this.handleSDGClick();
                }}
                label="SDGs"
                className={classes.tab}
                classes={{
                  wrapper: classes.wrapper,
                  root: classes.tabsRoot,
                  labelIcon: classes.labelIcon,
                  textColorInherit: classes.textColorInherit
                }}
                icon={
                  isSDGActive ? (
                    <KeyboardArrowUp className={classes.KeyboardArrow} />
                  ) : (
                    <KeyboardArrowDown className={classes.KeyboardArrow} />
                  )
                }
              />
            </Tabs>
          </AppBar>
        </Layout>
      </div>
    );
  }
}

ProfileTabs.propTypes = {
  classes: PropTypes.shape().isRequired,
  tabs: PropTypes.arrayOf(
    PropTypes.shape({
      name: PropTypes.string.isRequired,
      href: PropTypes.string.isRequired
    })
  ),
  width: PropTypes.string.isRequired
};

ProfileTabs.defaultProps = {
  tabs: TABS
};

export default withWidth()(withStyles(styles)(ProfileTabs));
