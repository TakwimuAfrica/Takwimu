import React from 'react';
import PropTypes from 'prop-types';

import classNames from 'classnames';

import { withStyles } from '@material-ui/core/styles';

const styles = theme => ({
  container: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '28.03125rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '37.375rem'
    },
    position: 'relative'
  },
  iframe: {
    top: 0,
    left: 0,
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '26.71875rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '33.875rem'
    },
    height: '450px',
    border: 0,
    '& .census-chart-embed': {
      background: theme.palette.data.light
    }
  }
});

class IFrame extends React.Component {
  constructor(props) {
    super(props);
    this.handleFrameLoad = this.handleFrameLoad.bind(this);
  }

  componentDidMount() {
    const { id } = this.props;
    const iframe = document.getElementById(id);
    iframe.addEventListener('load', this.handleFrameLoad, true);
  }

  handleFrameLoad() {
    const { id } = this.props;
    const iframe = document.getElementById(id);

    // add domtoimage
    const frameHead = iframe.contentDocument
      .getElementsByTagName('head')
      .item(0);
    const script = iframe.contentDocument.createElement('script');
    script.type = 'text/javascript';
    script.src =
      'https://cdnjs.cloudflare.com/ajax/libs/dom-to-image/2.6.0/dom-to-image.min.js';
    frameHead.appendChild(script);

    // eslint-disable-next-line no-return-assign, no-param-reassign
    const hideFooter = n => (n.style = 'display: none');
    iframe.contentWindow.document.body.style.background = '#F5F5F5';
    iframe.contentWindow.document
      .querySelectorAll('.embed-footer')
      .forEach(hideFooter);
  }

  render() {
    const { id, classes, data } = this.props;

    return (
      <div className={classNames(['cr-embed', classes.container])}>
        <iframe
          id={id}
          title={data.title}
          src={`/embed/iframe.html?geoID=country-${
            data.data_country
          }&geoVersion=2009&chartDataID=${
            data.data_id
          }&dataYear=2011&chartType=${
            data.chart_type
          }&chartHeight=300&chartTitle=${data.title}&initialSort=&statType=${
            data.data_stat_type
          }`}
          allowFullScreen
          className={classNames(['census-reporter-embed', classes.iframe])}
        />
      </div>
    );
  }
}

IFrame.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  id: PropTypes.string.isRequired,
  data: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(IFrame);
