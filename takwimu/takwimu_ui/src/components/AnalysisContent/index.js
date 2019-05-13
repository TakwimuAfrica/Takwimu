/* eslint-disable react/no-danger */
import React, { Fragment, useEffect } from 'react';
import { PropTypes } from 'prop-types';

import { Typography, withStyles, Grid } from '@material-ui/core';

import Actions from './Actions';
import { Analysis as AnalysisReadNext } from '../Next';
import ContentNavigation from './ContentNavigation';
import OtherInfoNav from './OtherInfoNav';
import RelatedContent from '../RelatedContent';
import ViewCountry from '../ViewCountry';

import DataContainer from '../DataContainer';

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

  return (
    <div id="analysis">
      <div id="analysis-navigation">
        <OtherInfoNav
          labelText="Other topics in"
          labelTextStrong={content.title}
          content={content}
          current={topicIndex}
          showContent={showContent}
        />
      </div>
      <div className={classes.hero} />

      <div className={classes.root}>
        <Typography id="analysis-title" className={classes.title} variant="h2">
          {content.body[topicIndex].value.title}
        </Typography>

        <div id="analysis-actions">
          <ContentNavigation
            labelText="Other topics in"
            labelTextStrong={content.title}
            current={topicIndex}
            content={content}
            showContent={showContent}
          />
          <Actions />
        </div>

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

        <div id="analysis-footer">
          <Actions hideLastUpdated />
          <ContentNavigation
            labelText="Other topics in"
            labelTextStrong={content.title}
            current={topicIndex}
            content={content}
            showContent={showContent}
          />
          <AnalysisReadNext
            classes={{ container: classes.readNextContainer }}
            content={content}
            current={topicIndex}
            showContent={showContent}
          />
          <ViewCountry takwimu={takwimu} />
          <RelatedContent relatedContent={content.related_content} />
        </div>
      </div>
    </div>
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
