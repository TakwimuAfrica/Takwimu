import React, { useState, useEffect } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, ButtonBase } from '@material-ui/core';

import { countrify } from '../../core';

import logoWhite from '../../../assets/images/logo-white-all.png';
import downloadIcon from '../../../assets/images/analysis/download.svg';

const styles = {
  root: {
    fontSize: '0.813rem',
    color: '#848484'
  },
  actionIcon: {
    marginRight: '21px'
  }
};

const createPdfStyles = StyleSheet =>
  StyleSheet.create({
    page: {
      padding: 20,
      paddingBottom: 50
    },
    section: {
      padding: 20
    },
    footer: {
      position: 'absolute',
      height: 50,
      bottom: 0,
      right: 40,
      left: 40
    },
    header: {
      position: 'relative',
      height: 100,
      marginLeft: -20,
      marginRight: -20,
      marginBottom: 20
    },
    divider: {
      height: 4,
      marginTop: 46,
      backgroundColor: '#29a87c',
      width: '100%'
    },
    downloadedAt: {
      position: 'absolute',
      fontSize: 14,
      left: 0
    },
    linkTakwimuFooter: {
      position: 'absolute',
      fontSize: 14,
      right: 0,
      color: 'black',
      textDecoration: 'none'
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

const createPdf = (Document, Image, Link, Page, Text, View) => {
  function AnalysisPDF({ classes, topic, data, takwimu }) {
    return (
      <Document>
        <Page size="A4" style={classes.page}>
          <View style={classes.header} fixed>
            <Link href="https://takwimu.africa" style={classes.linkTakwimu}>
              www.takwimu.africa
            </Link>
            <View style={classes.divider} />
            <Link
              style={classes.linkLicense}
              href="//creativecommons.org/licenses/by/4.0/"
            >
              2018 Takwimu CC by 4.0
            </Link>
            <View style={classes.logoBackground}>
              <Image style={classes.logo} src={logoWhite} />
            </View>
          </View>
          <View style={classes.section}>
            <Text style={classes.title}>
              {countrify(
                data.content.title,
                takwimu.country,
                takwimu.countries,
                ' : '
              )}
            </Text>
          </View>
          {topic === 'topic' ? (
            <View style={classes.section}>
              {data.content.body.map(c => {
                if (c.type === 'text') {
                  return c.value.split('</p>').map(t => (
                    <Text key={t} style={classes.text}>
                      {t.replace(/<(?:.|\n)*?>/gi, '')}
                    </Text>
                  ));
                }
                return null;
              })}
            </View>
          ) : (
            <View style={classes.section}>
              <Text style={classes.boldText}>
                {data.item.name}, {data.item.title}
              </Text>
              {data.item.description.split('</p>').map(t => (
                <Text style={classes.text}>
                  {t.replace(/<(?:.|\n)*?>/gi, '')}
                </Text>
              ))}
            </View>
          )}

          <View style={classes.footer} fixed>
            <Text style={classes.downloadedAt}>
              Dowloaded{' '}
              {new Date().toLocaleDateString('UTC', {
                day: '2-digit',
                month: 'short',
                year: 'numeric'
              })}
            </Text>
            <Link
              href="https://takwimu.africa"
              style={classes.linkTakwimuFooter}
            >
              www.takwimu.africa
            </Link>
          </View>
        </Page>
      </Document>
    );
  }

  AnalysisPDF.propTypes = {
    classes: PropTypes.shape({}).isRequired,
    data: PropTypes.shape({}).isRequired,
    topic: PropTypes.oneOf(['topic', 'carousel_topic']).isRequired,
    takwimu: PropTypes.shape({}).isRequired
  };
  return AnalysisPDF;
};

function DownloadPDF({ classes, title, topic, data, takwimu }) {
  const [reactPdf, setReactPdf] = useState(false);
  const [pdfBlob, setPdfBlob] = useState(null);

  useEffect(() => {
    import('../../../modules/react-pdf').then(m => {
      setReactPdf(m.default);
    });
  }, []);

  useEffect(() => {
    if (reactPdf) {
      const {
        ReactPDF,
        Document,
        Image,
        Link,
        Page,
        StyleSheet,
        Text,
        View
      } = reactPdf;
      const pdfClasses = createPdfStyles(StyleSheet);
      const AnalysisPDF = createPdf(Document, Image, Link, Page, Text, View);
      ReactPDF.pdf(
        <AnalysisPDF
          classes={pdfClasses}
          topic={topic}
          data={data}
          takwimu={takwimu}
        />
      )
        .toBlob()
        .then(setPdfBlob);
    }
  }, [reactPdf, data]);

  return (
    <ButtonBase
      ga-on="click"
      ga-event-category="Analysis"
      ga-event-action={`Download ${title}`}
      ga-event-label={title}
      className={classes.root}
      disabled={pdfBlob === null}
      onClick={() => {
        if (pdfBlob) {
          const link = document.createElement('a');
          link.href = URL.createObjectURL(pdfBlob);
          link.download = `${title}.pdf`;
          link.target = '_blank';
          document.body.appendChild(link);
          link.click();
          document.body.removeChild(link);
          URL.revokeObjectURL(pdfBlob);
        }
      }}
    >
      <img alt="download" src={downloadIcon} className={classes.actionIcon} />
      Download this analysis (PDF
      {pdfBlob && ` ${(pdfBlob.size / 1000).toFixed(1)}kb`})
    </ButtonBase>
  );
}

DownloadPDF.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  title: PropTypes.string.isRequired,
  data: PropTypes.shape({}).isRequired,
  topic: PropTypes.oneOf(['topic', 'carousel_topic']).isRequired,
  takwimu: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(DownloadPDF);
