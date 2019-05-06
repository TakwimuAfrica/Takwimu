/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { Typography, withStyles, Grid } from '@material-ui/core';

import Actions from './Actions';
import { Analysis as AnalysisReadNext } from '../Next';
import ContentNavigation from './ContentNavigation';
import CountryContent from '../CountryContent';
import DataContainer from '../DataContainer';
import OtherInfoNav from './OtherInfoNav';
import RelatedContent from '../RelatedContent';

import profileHeroImage from '../../assets/images/profile-hero-line.png';

const styles = theme => ({
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
  },
  dataContainer: {
    margin: '0.625rem',
    width: '100%'
  },
  hero: {
    backgroundImage: `url(${profileHeroImage})`,
    backgroundPosition: 'center',
    backgroundPositionY: '-6.25rem',
    backgroundRepeat: 'no-repeat',
    backgroundSize: '100%',
    borderBottomColor: theme.palette.primary.main,
    borderBottomStyle: 'solid',
    borderBottomWidth: '0.25rem',
    marginTop: '0.375rem',
    width: '100%',
    height: '21.125rem'
  }
});

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
    const {
      profile_navigation: { value: profileNavigation },
      read_next: { value: readNext }
    } = content;

    return (
      <Fragment>
        <OtherInfoNav
          labelText={profileNavigation.title}
          labelTextStrong={content.title}
          content={content}
          current={topicIndex}
          showContent={this.showContent}
        />

        <div className={classes.hero} />

        <div className={classes.root}>
          <Typography className={classes.title} variant="h2">
            {content.body[topicIndex].value.title}
          </Typography>
          <ContentNavigation
            labelText="Other topics in"
            labelTextStrong={content.title}
            current={topicIndex}
            content={content}
            showContent={this.showContent}
          />
          <Actions />

          <Grid container direction="row">
            {content.body[topicIndex].value.body.map(c => (
              <Fragment>
                {c.type === 'text' && (
                  <Typography
                    key={c.id}
                    className={classes.body}
                    dangerouslySetInnerHTML={{
                      __html: c.value
                    }}
                  />
                )}
                {c.type === 'indicator' && (
                  <DataContainer
                    key={c.id}
                    id={c.id}
                    classes={{ root: classes.dataContainer }}
                    data={c.value.widget}
                  />
                )}
              </Fragment>
            ))}
          </Grid>

          <Actions hideLastUpdated />
          <ContentNavigation
            labelText={profileNavigation.title}
            labelTextStrong={content.title}
            current={topicIndex}
            content={content}
            showContent={this.showContent}
          />
          <AnalysisReadNext
            classes={{ container: classes.readNextContainer }}
            title={readNext.title}
            content={content}
            current={topicIndex}
            showContent={this.showContent}
          />
          <CountryContent
            content={content.view_country_content}
            takwimu={takwimu}
          />
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
