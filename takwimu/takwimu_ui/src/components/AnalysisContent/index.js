/* eslint-disable react/no-danger */
import React, { Fragment, useEffect } from 'react';
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

function AnalysisContent({ classes, content, topicIndex, takwimu, onChange }) {
  useEffect(() => {
    if (document.getElementsByClassName('flourish-embed')) {
      const script = document.createElement('script');
      const oldScript = document.getElementById('flourish-script');
      if (oldScript) {
        oldScript.remove();
      }

      window.FlourishLoaded = false;
      script.id = 'flourish-script';
      script.src = 'https://public.flourish.studio/resources/embed.js';
      document.body.appendChild(script);
    }
  });

  const showContent = index => () => {
    onChange(index);
  };

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
        showContent={showContent}
      />
      <div className={classes.hero} />

      <div className={classes.root}>
        <Typography className={classes.title} variant="h2">
          {content.body[topicIndex].value.title}
        </Typography>
        <ContentNavigation
          labelText={profileNavigation.title}
          labelTextStrong={content.title}
          current={topicIndex}
          content={content}
          showContent={showContent}
        />
        <Actions page={takwimu.page} />

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
                <DataContainer key={c.id} id={c.id} indicator={c} />
              )}
            </Fragment>
          ))}
        </Grid>

        <Actions page={takwimu.page} hideLastUpdated />
        <ContentNavigation
          labelText={profileNavigation.title}
          labelTextStrong={content.title}
          current={topicIndex}
          content={content}
          showContent={showContent}
        />
        <AnalysisReadNext
          classes={{ container: classes.readNextContainer }}
          title={readNext.title}
          content={content}
          current={topicIndex}
          showContent={showContent}
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

AnalysisContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  content: PropTypes.shape({}).isRequired,
  topicIndex: PropTypes.number.isRequired,
  onChange: PropTypes.func.isRequired,
  takwimu: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisContent);
