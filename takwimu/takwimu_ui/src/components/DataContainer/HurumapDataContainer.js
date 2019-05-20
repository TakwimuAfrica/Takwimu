/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withTheme } from '@material-ui/core/styles';

import DataActions from './DataActions';
import IFrame from './IFrame';
import { getShareHandler } from './common';

function DataContainer({ id, data, theme, summary }) {
  const iframeId = `cr-embed-country-${data.data_country}-${data.data_id}`;
  const handleDownload = () => {
    const iframe = document.getElementById(iframeId);
    iframe.contentWindow.domtoimage
      .toPng(iframe.contentDocument.getElementById('census-chart'), {
        bgcolor: theme.palette.data.light
      })
      .then(dataUrl => {
        const link = document.createElement('a');
        link.download = `${data.title}.png`;
        link.href = dataUrl;
        link.target = '_blank';
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
        onShare={getShareHandler(id, data.title, summary)}
      />
    </Fragment>
  );
}

DataContainer.propTypes = {
  theme: PropTypes.shape({}).isRequired,
  data: PropTypes.shape({}).isRequired,
  id: PropTypes.string.isRequired,
  summary: PropTypes.string.isRequired
};

export default withTheme()(DataContainer);
