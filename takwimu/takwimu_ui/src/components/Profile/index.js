import React from 'react';
import PropTypes from 'prop-types';

import { withStyles } from '@material-ui/core/styles';

import { RichTypography } from '../core';
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
      tabs,
      description
    } = profile;
    const { value } = this.state;

    const title = value === 0 ? 'Data by Topic' : tabs[value].name;

    // Wagtail inserts div/p when RichTextField is empty
    const hasDescription = () =>
      description &&
      description.length > 0 &&
      description !== '<p></p>' &&
      description !== '<div class="rich-text"></div>';
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
          {hasDescription && (
            <RichTypography className={classes.description}>
              {description}
            </RichTypography>
          )}
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
    description: PropTypes.string,
    switchToTab: PropTypes.func
  }).isRequired
};

export default withStyles(styles)(Profile);
