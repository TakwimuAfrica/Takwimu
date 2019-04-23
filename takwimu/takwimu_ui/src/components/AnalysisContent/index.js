/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { Typography, withStyles } from '@material-ui/core';

import Actions from './Actions';
import { Analysis as AnalysisReadNext } from '../Next';
import OtherInfoNav from './OtherInfoNav';
import OtherInfo from './OtherInfo';
import RelatedContent from '../RelatedContent';
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
  },
  readNextContainer: {
    paddingBottom: '2.3125rem'
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
          <AnalysisReadNext
            classes={{ container: classes.readNextContainer }}
            content={content}
            current={topicIndex}
            showContent={this.showContent}
          />
          <ViewCountry takwimu={takwimu} />
          <RelatedContent content={content.related_content} />
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
