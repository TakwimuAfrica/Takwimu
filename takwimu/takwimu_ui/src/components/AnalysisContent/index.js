/* eslint-disable react/no-danger */
import React, { Fragment, useEffect, useState } from 'react';
import { PropTypes } from 'prop-types';

import { Typography, withStyles, Grid } from '@material-ui/core';

import ReactPDF, {
  Document,
  Page,
  Text,
  View,
  Image,
  Font,
  StyleSheet
} from '@react-pdf/renderer';
import Actions from './Actions';
import { Analysis as AnalysisReadNext } from '../Next';
import ContentNavigation from './ContentNavigation';
import CountryContent from '../CountryContent';
import DataContainer from '../DataContainer';
import OtherInfoNav from './OtherInfoNav';
import RelatedContent from '../RelatedContent';

import profileHeroImage from '../../assets/images/profile-hero-line.png';
import CarouselTopic from './topics/CarouselTopic';

// TODO: Turn indicators to images
// import html2canvas from 'html2canvas';

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

// Create styles
const pdfStyles = StyleSheet.create({
  page: {
    padding: 20
  },
  section: {
    padding: 20
  },
  hero: {
    borderBottomWidth: 2,
    borderBottomColor: '#29a87c',
    borderBottomStyle: 'solid',
    height: 200,
    objectFit: 'cover'
  },
  title: {
    fontSize: 54,
    fontFamily: 'Lora'
  },
  text: {
    fontSize: 18,
    lineHeight: 2.05,
    fontFamily: 'Muli'
  }
});

// https://gist.github.com/dotJoel/7326331
Font.register(
  'http://themes.googleusercontent.com/static/fonts/muli/v4/BfQP1MR3mJNaumtWa4Tizg.ttf',
  { family: 'Muli' }
);
Font.register(
  'http://themes.googleusercontent.com/static/fonts/lora/v5/4A-myfZX6oDr9CtSTkTGig.ttf',
  { family: 'Lora' }
);

const AnalysisPDF = ({ /* images={images} , */ content }) => (
  <Document>
    <Page size="A4" style={pdfStyles.page}>
      <Image style={pdfStyles.hero} src={profileHeroImage} />
      <View style={pdfStyles.section}>
        <Text style={pdfStyles.title}>{content.title}</Text>
      </View>
      <View style={pdfStyles.section}>
        {content.body.map(c => {
          if (c.type === 'text') {
            return c.value
              .split('</p>')
              .map(t => (
                <Text style={pdfStyles.text}>
                  {t.replace(/<(?:.|\n)*?>/gi, '')}
                </Text>
              ));
          }

          // TODO: Turn indicators to images
          // if (c.type === 'indicator') {
          //   return <Image src={images[c.id]}/>;
          // }

          return null;
        })}
      </View>
    </Page>
  </Document>
);

AnalysisPDF.propTypes = {
  content: PropTypes.shape({}).isRequired
};

function AnalysisContent({ classes, content, topicIndex, takwimu, onChange }) {
  const [analysisBlob, setAnalysisBlob] = useState(null);
  const [id, setId] = useState(null);
  // TODO: Turn indicators to images
  // const [images, setImages] = useState({});

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

    // TODO: Turn indicators to images
    // document.querySelectorAll("[id^='DataContainer-']").forEach(async el => {
    //   const canvas = await html2canvas(el);
    //   setImages({ ...images, [el.id.replace('DataContainer-', '')]: canvas.toDataURL("image/png") })
    // });

    ReactPDF.pdf(
      <AnalysisPDF
        content={content.body[topicIndex].value}
        /* images={images} */
      />
    )
      .toBlob()
      .then(setAnalysisBlob);
  }, [id]);

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

        <Actions
          title={content.body[topicIndex].value.title}
          page={takwimu.page}
          pdfBlob={analysisBlob}
        />

        {content.body[topicIndex].type === 'carousel_topic' ? (
          <CarouselTopic data={content.body[topicIndex].value.body} />
        ) : (
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
                    indicator={c}
                  />
                )}
              </Fragment>
            ))}
          </Grid>
        )}

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
