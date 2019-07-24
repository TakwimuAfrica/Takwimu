/* eslint-disable react/no-danger */
import React, { Fragment, useEffect, useState } from 'react';
import { PropTypes } from 'prop-types';

import { Typography, withStyles, Grid } from '@material-ui/core';

import { RichTypography } from '../core';
import Actions from './Actions';
import { Analysis as AnalysisReadNext } from '../Next';
import CarouselTopic from './topics/CarouselTopic';
import CountryContent from '../CountryContent';
import ContentNavigation from './ContentNavigation';
import DataContainer from '../DataContainer';
import RelatedContent from '../RelatedContent';
import OtherInfoNav from './OtherInfoNav';

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
    paddingBottom: '2.25rem'
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
    height: '21.125rem',
    [theme.breakpoints.up('md')]: {
      height: '17.125rem',
      backgroundPositionY: '-3rem'
    },
    [theme.breakpoints.up('lg')]: {
      height: '21.125rem',
      backgroundPositionY: '-6.25rem'
    }
  }
});

function AnalysisContent({ classes, content, topicIndex, takwimu, onChange }) {
  const [carouselItemIndex, setCarouselItemIndex] = useState(
    content.body[topicIndex].type === 'carousel_topic' ? 0 : -1
  );
  useEffect(() => {
    setCarouselItemIndex(
      content.body[topicIndex].type === 'carousel_topic' ? 0 : -1
    );
  }, [topicIndex]);

  const [id, setId] = useState(`${content.id}-${topicIndex}`);
  useEffect(() => {
    if (`${content.id}-${topicIndex}` !== id) {
      setId(`${content.id}-${topicIndex}`);
    }
  });

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
  }, [id, carouselItemIndex]);

  const showContent = index => () => {
    onChange(index);
  };

  const {
    profile_navigation: { value: profileNavigation },
    read_next: { value: readNext }
  } = content;

  const topic = content.body[topicIndex].type;
  const data = {
    item:
      carouselItemIndex !== -1
        ? content.body[topicIndex].value.body[carouselItemIndex]
        : null,
    content: content.body[topicIndex].value
  };

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

        <Actions
          title={content.body[topicIndex].value.title}
          page={takwimu.page}
          topic={topic}
          data={data}
          takwimu={takwimu}
        />

        {content.body[topicIndex].type === 'carousel_topic' ? (
          <CarouselTopic
            key={topicIndex}
            data={content.body[topicIndex].value.body}
            onIndexChanged={setCarouselItemIndex}
          />
        ) : (
          <Grid container direction="row">
            {content.body[topicIndex].value.body.map(c => (
              <Fragment key={c.id}>
                {c.type === 'text' && (
                  <RichTypography className={classes.body}>
                    {c.value}
                  </RichTypography>
                )}
                {c.type === 'indicator' && (
                  <DataContainer
                    id={c.id}
                    classes={{ root: classes.dataContainer }}
                    indicator={c}
                    country={takwimu.country}
                  />
                )}
              </Fragment>
            ))}
          </Grid>
        )}

        <Actions
          title={content.body[topicIndex].value.title}
          page={takwimu.page}
          topic={topic}
          data={data}
          takwimu={takwimu}
          hideLastUpdated
        />
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
