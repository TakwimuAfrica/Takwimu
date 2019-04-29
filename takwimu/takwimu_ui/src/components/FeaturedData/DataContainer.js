/* eslint-disable react/no-danger */
import React, { useState, useEffect } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography, Grid } from '@material-ui/core';
import { ArrowDropUp } from '@material-ui/icons';

import PDF from 'react-pdf-js';
import domtoimage from 'dom-to-image';
import DataActions from './DataActions';
import IFrame from './IFrame';

const styles = theme => ({
  root: {
    margin: '1.25rem 0',
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '28.03125rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '37.375rem'
    }
  },
  dataContainer: {
    padding: '0.625rem',
    backgroundColor: theme.palette.data.light,
    overflow: 'hidden',
    [theme.breakpoints.up('md')]: {
      padding: '1.25rem'
    }
  },
  descriptionContainer: {
    padding: '0 0.625em',
    [theme.breakpoints.up('md')]: {
      padding: '0 2.625rem'
    }
  },
  description: {
    color: theme.palette.data.main,
    marginLeft: '1.25rem'
  },
  indicatorTitle: {
    fontWeight: 'bold',
    lineHeight: 1.2,
    marginBottom: '0.625rem'
  }
});

function DataContainer({ id, classes, featuredData, widget }) {
  const [images, setImages] = useState({});
  const [documents, setDocuments] = useState({});

  useEffect(() => {
    if (widget.type === 'entities') {
      widget.value.entities.forEach(
        entity =>
          entity.image &&
          fetch(`/api/v2/images/${entity.image}`)
            .then(response => response.json())
            .then(json =>
              setImages(prev => ({
                ...prev,
                [json.id]: json.meta.download_url
              }))
            )
      );
    }
    if (widget.type === 'document') {
      if (widget.value.document) {
        fetch(`/api/v2/documents/${widget.value.document}`)
          .then(response => response.json())
          .then(json =>
            setDocuments(prev => ({
              ...prev,
              [json.id]: json.meta.download_url
            }))
          );
      }
    }

    return () => {};
  }, []);

  const embedCode = featuredData
    ? `<iframe
    allowFullScreen
    title="${featuredData.title}"
    src="/embed/iframe.html?geoID=country-${
      featuredData.country
    }&geoVersion=2009&chartDataID=${
        featuredData.data_id
      }&dataYear=2011&chartType=${
        featuredData.chart_type
      }&chartHeight=300&chartTitle=${
        featuredData.title
      }&initialSort=&statType=${featuredData.data_stat_type}"
/>`
    : `${widget.value.raw_html}`;

  return (
    <div className={classes.root}>
      <div className={classes.dataContainer}>
        <Grid container direction="column" alignItems="center">
          {featuredData && <IFrame featuredData={featuredData} />}

          {widget.type === 'html' && (
            <div id={`data-indicator-${id}`} style={{ minWidth: '25rem' }}>
              <Typography
                variant="body1"
                align="center"
                className={classes.indicatorTitle}
              >
                {widget.value.title}
              </Typography>
              <div
                dangerouslySetInnerHTML={{ __html: widget.value.raw_html }}
              />
            </div>
          )}

          {widget.type === 'entities' &&
            widget.value.entities.map(entity => (
              <div id={`data-indicator-${id}`}>
                <Typography
                  variant="body1"
                  align="center"
                  className={classes.indicatorTitle}
                >
                  {widget.value.title}
                </Typography>
                {entity.image && <img alt="" src={images[entity.image]} />}
                <div dangerouslySetInnerHTML={{ __html: entity.description }} />
              </div>
            ))}

          {widget.type === 'document' && (
            <div id={`data-indicator-${id}`} style={{ width: '25rem' }}>
              <Typography
                variant="body1"
                align="center"
                className={classes.indicatorTitle}
              >
                {widget.value.title}
              </Typography>
              {documents[widget.value.document] && (
                <PDF scale={0.65} file={documents[widget.value.document]} />
              )}
            </div>
          )}
          <DataActions
            onDownload={() => {
              if (featuredData) {
                const iframe = document.getElementById(
                  `cr-embed-country-${featuredData.country}-${
                    featuredData.data_id
                  }`
                );
                iframe.contentWindow.domtoimage
                  .toJpeg(iframe.contentDocument.body)
                  .then(dataUrl => {
                    const link = document.createElement('a');
                    link.download = `${featuredData.title}.jpeg`;
                    link.href = dataUrl;
                    link.click();
                  });
              } else {
                const el = document.getElementById(`data-indicator-${id}`);
                const temp = el.style.height;
                el.style.height = 'unset';
                domtoimage
                  .toPng(el)
                  .then(dataUrl => {
                    const link = document.createElement('a');
                    link.download = `${widget.value.title}.png`;
                    link.href = dataUrl;
                    link.click();
                  })
                  .finally(() => {
                    el.style.height = temp;
                  });
              }
            }}
            embedCode={embedCode}
          />
        </Grid>
      </div>

      {featuredData && (
        <div className={classes.descriptionContainer}>
          <Grid container direction="row" wrap="nowrap">
            <Grid item>
              <ArrowDropUp color="primary" />
            </Grid>
            <Grid item>
              <Typography variant="caption" className={classes.description}>
                {featuredData.description}
              </Typography>
            </Grid>
          </Grid>
        </div>
      )}
    </div>
  );
}

DataContainer.propTypes = {
  id: PropTypes.string,
  classes: PropTypes.shape({}).isRequired,
  featuredData: PropTypes.shape({}),
  widget: PropTypes.shape({})
};

DataContainer.defaultProps = {
  id: '',
  featuredData: null,
  widget: null
};

export default withStyles(styles)(DataContainer);
