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

    this.showContent = this.showContent.bind(this);
  }

  showContent(index) {
    const { onChange } = this.props;
    return () => {
      onChange(index);
    };
  }

  render() {
    const { classes, content, topicIndex, takwimu } = this.props;

    return (
      <Fragment>
        <OtherInfoNav
          labelText="Other topics in"
          labelTextStrong={content.title}
          content={content}
          current={topicIndex}
          showContent={this.showContent}
        />

        <div className={classes.root}>
          <Typography className={classes.title} variant="h2">
            {content.body[topicIndex].value.title}
          </Typography>
          <OtherInfo
            labelText="Other topics in"
            labelTextStrong={content.title}
            current={topicIndex}
            content={content}
            showContent={this.showContent}
          />
          <Actions />
          <Typography
            className={classes.body}
            dangerouslySetInnerHTML={{
              __html: content.body[topicIndex].value.body
            }}
          />
          <Actions hideLastUpdated />
          <OtherInfo
            labelText="Other topics in"
            labelTextStrong={content.title}
            current={topicIndex}
            content={content}
            showContent={this.showContent}
          />
          <ViewCountry takwimu={takwimu} />
          <AnalysisReadNext
            current={topicIndex}
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
  topicIndex: PropTypes.number.isRequired,
  onChange: PropTypes.func.isRequired,
  takwimu: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisContent);
