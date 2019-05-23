/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withTheme } from '@material-ui/core/styles';

import DataActions from './DataActions';
import IFrame from './IFrame';
import { shareIndicator, uploadImage } from './common';

function DataContainer({ id, data, theme }) {
  const iframeId = `cr-embed-country-${data.data_country}-${data.data_id}`;

  const toCanvas = () => {
    const iframe = document.getElementById(iframeId);
    return iframe.contentWindow.domtoimage.toPng(
      iframe.contentDocument.getElementById('census-chart'),
      {
        bgcolor: theme.palette.data.light
      }
    );
  };

  const handleShare = () => {
    toCanvas().then(canvas => {
      uploadImage(id, canvas.toDataURL('image/png')).then(success => {
        if (success) {
          shareIndicator(id);
        }
      });
    });
  };

  const handleDownload = () => {
    toCanvas().then(canvas => {
      const link = document.createElement('a');
      link.download = `${data.title}.png`;
      link.target = '_blank';
      link.href = canvas.toDataURL('image/png');
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    });
  };

  const embedCode = `<iframe
    allowFullScreen
    title="${data.title}"
    src="/embed/iframe.html?geoID=country-${
      data.data_country
    }&geoVersion=2009&chartDataID=${data.data_id}&dataYear=2011&chartType=${
    data.chart_type
  }&chartHeight=300&chartTitle=${data.title}&initialSort=&statType=${
    data.data_stat_type
  }"
/>`;

  return (
    <Fragment>
      <IFrame id={iframeId} data={data} />

      <DataActions
        onDownload={handleDownload}
        embedCode={embedCode}
        onShare={handleShare}
      />
    </Fragment>
  );
}

DataContainer.propTypes = {
  theme: PropTypes.shape({}).isRequired,
  data: PropTypes.shape({}).isRequired,
  id: PropTypes.string.isRequired
};

export default withTheme()(DataContainer);
