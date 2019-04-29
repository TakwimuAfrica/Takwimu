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

function DataContainer({ id, classes, data }) {
  const [images, setImages] = useState({});
  const [documents, setDocuments] = useState({});

  useEffect(() => {
    if (data.type === 'entities') {
      data.value.entities.forEach(
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
    if (data.type === 'document') {
      if (data.value.document) {
        fetch(`/api/v2/documents/${data.value.document}`)
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

  const handleDownload = () => {
    if (data.type === 'featured_data') {
      const iframe = document.getElementById(
        `cr-embed-country-${data.country}-${data.data_id}`
      );
      iframe.contentWindow.domtoimage
        .toJpeg(iframe.contentDocument.body)
        .then(dataUrl => {
          const link = document.createElement('a');
          link.download = `${data.title}.jpeg`;
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
          link.download = `${data.value.title}.png`;
          link.href = dataUrl;
          link.click();
        })
        .finally(() => {
          el.style.height = temp;
        });
    }
  };

  const embedCode =
    data.type === 'featured_data'
      ? `<iframe
    allowFullScreen
    title="${data.title}"
    src="/embed/iframe.html?geoID=country-${
      data.country
    }&geoVersion=2009&chartDataID=${data.data_id}&dataYear=2011&chartType=${
          data.chart_type
        }&chartHeight=300&chartTitle=${data.title}&initialSort=&statType=${
          data.data_stat_type
        }"
/>`
      : `${data.value.raw_html}`;

  return (
    <div className={classes.root}>
      <div className={classes.dataContainer}>
        <Grid container direction="column" alignItems="center">
          <Typography
            variant="body1"
            align="center"
            className={classes.indicatorTitle}
          >
            {data.value.title}
          </Typography>

          {data.type === 'featured_data' && (
            <IFrame featuredData={data.value} />
          )}

          {data.type === 'html' && (
            <div
              id={`data-indicator-${id}`}
              style={{ width: 'min-content', minWidth: '25rem' }}
            >
              <div dangerouslySetInnerHTML={{ __html: data.value.raw_html }} />
            </div>
          )}

          {data.type === 'entities' &&
            data.value.entities.map(entity => (
              <div
                id={`data-indicator-${id}`}
                style={{ width: '25rem', height: '250px', overflow: 'scroll' }}
              >
                {entity.image && <img alt="" src={images[entity.image]} />}
                <div dangerouslySetInnerHTML={{ __html: entity.description }} />
              </div>
            ))}

          {data.type === 'document' && (
            <div id={`data-indicator-${id}`} style={{ width: '25rem' }}>
              {documents[data.value.document] && (
                <PDF scale={0.65} file={documents[data.value.document]} />
              )}
            </div>
          )}
          <DataActions onDownload={handleDownload} embedCode={embedCode} />
        </Grid>
      </div>

      {data.type === 'featured_data' && (
        <div className={classes.descriptionContainer}>
          <Grid container direction="row" wrap="nowrap">
            <Grid item>
              <ArrowDropUp color="primary" />
            </Grid>
            <Grid item>
              <Typography variant="caption" className={classes.description}>
                {data.value.description}
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
  data: PropTypes.shape({}).isRequired
};

DataContainer.defaultProps = {
  id: ''
};

export default withStyles(styles)(DataContainer);
