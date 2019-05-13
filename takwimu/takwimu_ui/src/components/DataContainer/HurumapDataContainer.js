/* eslint-disable react/no-danger */
import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import DataActions from './DataActions';
import IFrame from './IFrame';

function DataContainer({ data }) {
  const handleDownload = () => {
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
  };

  const embedCode = `<iframe
    allowFullScreen
    title="${data.title}"
    src="/embed/iframe.html?geoID=country-${
      data.country
    }&geoVersion=2009&chartDataID=${data.data_id}&dataYear=2011&chartType=${
    data.chart_type
  }&chartHeight=300&chartTitle=${data.title}&initialSort=&statType=${
    data.data_stat_type
  }"
/>`;

  return (
    <Fragment>
      <IFrame featuredData={data} />

      <DataActions handleDownload={handleDownload} embedCode={embedCode} />
    </Fragment>
  );
}

DataContainer.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  data: PropTypes.shape({}).isRequired
};

export default DataContainer;
