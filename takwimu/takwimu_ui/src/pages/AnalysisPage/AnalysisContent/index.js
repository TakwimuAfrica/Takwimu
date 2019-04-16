/* eslint-disable react/no-danger */
import React from 'react';
import { Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import OtherTopics from './OtherTopics';
import Actions from './Actions';

const styles = {
  root: {
    maxWidth: '933px'
  },
  title: {
    margin: '37px 0 22px 19px'
  },
  body: {
    padding: '0 19px'
  }
};

class AnalysisContent extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      current: 0,
      currentId: null
    };

    this.showContent = this.showContent.bind(this);
  }

  showContent(index) {
    return () => {
      this.setState({ current: index });
    };
  }

  render() {
    const { classes, content } = this.props;
    const { current, currentId } = this.state;

    // Reset index when main content changes
    if (content.id !== currentId) {
      this.setState({ currentId: content.id, current: 0 });
    }

    return (
      <div className={classes.root}>
        <Typography className={classes.title} variant="h2">
          {content.body[current].value.title}
        </Typography>
        <OtherTopics
          current={current}
          content={content}
          showContent={this.showContent}
        />
        <Actions />
        <Typography
          className={classes.body}
          dangerouslySetInnerHTML={{ __html: content.body[current].value.body }}
        />
        <Actions hideLastUpdated />
        <OtherTopics
          current={current}
          content={content}
          showContent={this.showContent}
        />
      </div>
    );
  }
}

AnalysisContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisContent);
