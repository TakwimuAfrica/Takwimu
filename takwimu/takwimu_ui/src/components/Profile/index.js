import React from 'react';
import PropTypes from 'prop-types';

import { Typography } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import Section from '../Section';
import Tabs from './Tabs';

const styles = () => ({
  root: {},
  sectionTitle: {
    margin: '2.75rem 0'
  },
  description: {
    marginBottom: '1rem'
  }
});

class Profile extends React.Component {
  constructor(props) {
    super(props);

    const value = 0; // Start with the first item in the array
    this.state = { value };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event, value) {
    this.setState({ value });
    const {
      profile: { switchToTab }
    } = this.props;
    if (switchToTab) {
      switchToTab(value);
    }
  }

  render() {
    const { classes, profile } = this.props;
    const {
      geography: { this: geography },
      tabs
    } = profile;
    const { value } = this.state;
    const title = value === 0 ? 'Data by Topic' : tabs[value].name;

    return (
      <div className={classes.root}>
        <Tabs
          handleChange={this.handleChange}
          profile={profile}
          tabs={tabs}
          value={value}
        />
        <Section
          title={`${geography.name}'s ${title}`}
          classes={{ title: classes.sectionTitle }}
        >
          <Typography variant="body1" className={classes.description}>
            Lorem ipsom dolor sit amec cat this is an introduction to the
            demographics data topic for {geography.name} and should be
            editorially curated & populated via the backend.
          </Typography>
        </Section>
      </div>
    );
  }
}

Profile.propTypes = {
  classes: PropTypes.shape().isRequired,
  profile: PropTypes.shape({
    geography: PropTypes.shape({
      this: PropTypes.shape({
        name: PropTypes.string.isRequired
      })
    }).isRequired,
    tabs: PropTypes.arrayOf(
      PropTypes.shape({
        name: PropTypes.string.isRequired,
        href: PropTypes.string.isRequired
      })
    ).isRequired,
    switchToTab: PropTypes.func
  }).isRequired
};

export default withStyles(styles)(Profile);
