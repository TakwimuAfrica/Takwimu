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
  Link,
  StyleSheet
} from '@react-pdf/renderer';
import Actions from './Actions';
import { Analysis as AnalysisReadNext } from '../Next';
import CarouselTopic from './topics/CarouselTopic';
import CountryContent from '../CountryContent';
import ContentNavigation from './ContentNavigation';
import DataContainer from '../DataContainer';
import RelatedContent from '../RelatedContent';
import { RichTypography } from '../core';
import OtherInfoNav from './OtherInfoNav';

import profileHeroImage from '../../assets/images/profile-hero-line.png';
import logoWhite from '../../assets/images/logo-white-all.png';

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
  header: {
    position: 'relative',
    height: 100,
    marginLeft: -20,
    marginRight: -20
  },
  divider: {
    height: 4,
    marginTop: 46,
    backgroundColor: '#29a87c',
    width: '100%'
  },
  linkTakwimu: {
    position: 'absolute',
    top: 26,
    fontSize: 14,
    right: 20,
    color: 'black',
    textDecoration: 'none'
  },
  linkLicense: {
    position: 'absolute',
    top: 54,
    fontSize: 14,
    right: 20,
    color: 'black',
    textDecoration: 'none'
  },
  logo: {
    width: 80,
    marginTop: 42,
    marginLeft: 10
  },
  logoBackground: {
    position: 'absolute',
    left: 40,
    backgroundColor: '#29a87c',
    width: 100,
    height: 100,
    borderRadius: 50,
    borderBottomColor: '#ffffff',
    borderBottomStyle: 'solid',
    borderBottomWidth: 2
  },
  title: {
    fontSize: 54
    // fontFamily: 'Lora'
  },
  text: {
    fontSize: 14,
    lineHeight: 2.05,
    // fontFamily: 'Muli',
    paddingBottom: 28
  },
  boldText: {
    fontSize: 14,
    fontWeight: 500,
    lineHeight: 2.05,
    // fontFamily: 'Muli',
    paddingBottom: 28
  }
});

const AnalysisPDF = ({ data, topic }) => (
  <Document>
    <Page size="A4" style={pdfStyles.page}>
      <View style={pdfStyles.header}>
        <Link href="https://takwimu.africa" style={pdfStyles.linkTakwimu}>
          www.takwimu.africa
        </Link>
        <View style={pdfStyles.divider} />
        <Link
          style={pdfStyles.linkLicense}
          href="//creativecommons.org/licenses/by/4.0/"
        >
          2018 Takwimu CC by 4.0
        </Link>
        <View style={pdfStyles.logoBackground}>
          <Image style={pdfStyles.logo} src={logoWhite} />
        </View>
      </View>
      <View style={pdfStyles.section}>
        <Text style={pdfStyles.title}>{data.content.title}</Text>
      </View>
      {topic === 'topic' ? (
        <View style={pdfStyles.section}>
          {data.content.body.map(c => {
            if (c.type === 'text') {
              return c.value
                .split('</p>')
                .map(t => (
                  <Text style={pdfStyles.text}>
                    {t.replace(/<(?:.|\n)*?>/gi, '')}
                  </Text>
                ));
            }
            return null;
          })}
        </View>
      ) : (
        <View style={pdfStyles.section}>
          <Text style={pdfStyles.boldText}>
            {data.item.name}, {data.item.title}
          </Text>
          {data.item.description.split('</p>').map(t => (
            <Text style={pdfStyles.text}>
              {t.replace(/<(?:.|\n)*?>/gi, '')}
            </Text>
          ))}
        </View>
      )}
    </Page>
  </Document>
);

AnalysisPDF.propTypes = {
  data: PropTypes.shape({}).isRequired,
  topic: PropTypes.oneOf(['topic', 'carousel_topic']).isRequired
};

function AnalysisContent({ classes, content, topicIndex, takwimu, onChange }) {
  const [carouselItemIndex, setCarouselItemIndex] = useState(
    content.body[topicIndex].type === 'carousel_topic' ? 0 : -1
  );
  const [analysisBlob, setAnalysisBlob] = useState(null);
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

    ReactPDF.pdf(
      <AnalysisPDF
        topic={content.body[topicIndex].type}
        data={{
          item:
            carouselItemIndex !== -1
              ? content.body[topicIndex].value.body[carouselItemIndex]
              : null,
          content: content.body[topicIndex].value
        }}
      />
    )
      .toBlob()
      .then(setAnalysisBlob)
      .catch(console.error);
  }, [id, carouselItemIndex]);

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
          <CarouselTopic
            data={content.body[topicIndex].value.body}
            onIndexChanged={setCarouselItemIndex}
          />
        ) : (
          <Grid container direction="row">
            {content.body[topicIndex].value.body.map(c => (
              <Fragment>
                {c.type === 'text' && (
                  <RichTypography key={c.id} className={classes.body}>
                    {c.value}
                  </RichTypography>
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
