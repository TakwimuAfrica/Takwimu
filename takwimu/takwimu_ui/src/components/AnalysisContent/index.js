/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

import { Analysis as AnalysisReadNext } from '../Next';
import OtherInfoNav from './OtherInfoNav';
import OtherInfo from './OtherInfo';
import Actions from './Actions';
import ViewCountry from '../ViewCountry';

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
    const { classes, content, takwimu } = this.props;
    const { current, currentId } = this.state;

    // Reset index when main content changes
    if (content.id !== currentId) {
      this.setState({ currentId: content.id, current: 0 });
    }

    return (
      <Fragment>
        <OtherInfoNav
          labelText="Other topics in"
          labelTextStrong={content.title}
          content={content}
          current={current}
          showContent={this.showContent}
        />

        <div className={classes.root}>
          <Typography className={classes.title} variant="h2">
            {content.body[current].value.title}
          </Typography>
          <OtherInfo
            labelText="Other topics in"
            labelTextStrong={content.title}
            current={current}
            content={content}
            showContent={this.showContent}
          />
          <Actions />
          <Typography
            className={classes.body}
            dangerouslySetInnerHTML={{
              __html: content.body[current].value.body
            }}
          />
          <Actions hideLastUpdated />
          <OtherInfo
            labelText="Other topics in"
            labelTextStrong={content.title}
            current={current}
            content={content}
            showContent={this.showContent}
          />
          <ViewCountry takwimu={takwimu} />
          <AnalysisReadNext
            current={current}
            content={content}
            showContent={this.showContent}
          />
        </div>
      </Fragment>
    );
  }
}

AnalysisContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisContent);
