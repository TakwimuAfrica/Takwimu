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
    position: 'relative',
    paddingBottom: '56.25%'
    // margin: '2.8125rem 0'
  },
  iframe: {
    position: 'absolute',
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
      background: 'none'
    }
  }
});

// Work with a single iframe at a time and only resize it to it's
// "natural" dimensions
const makeCensusEmbed = containerId => {
  const embed = {
    embed: {}
  };
  embed.init = () => {
    embed.container = document.getElementById(containerId);
    if (embed.container) {
      embed.embed = {
        naturalWidth: embed.container.width,
        naturalHeight: embed.container.height,
        frameHeight: embed.container.height
      };
      embed.addListeners();
      embed.sendDataToFrame({ resize: 'resize' });
    }
  };
  embed.addListeners = () => {
    const eventMethod = window.addEventListener
      ? 'addEventListener'
      : 'attachEvent';
    const eventListener = window[eventMethod];
    const resizeEvent = eventMethod === 'attachEvent' ? 'onresize' : 'resize';
    eventListener(resizeEvent, embed.resize);
  };
  embed.debounce = (func, wait, immediate) => {
    let timeout;
    return (...args) => {
      const context = this;
      const later = () => {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      const callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };
  embed.resize = embed.debounce(() => {
    embed.setFrameSize();
    embed.sendDataToFrame({ resize: 'resize' });
  }, 100);
  embed.setFrameSize = () => {
    const thisContainer = embed.container;
    const thisEmbed = embed.embed;
    const parentWidth = thisContainer.offsetWidth;
    const minimumHeight = thisEmbed.frameHeight + 80;
    thisContainer.width =
      parentWidth <= thisEmbed.naturalWidth
        ? parentWidth
        : thisEmbed.naturalWidth;
    thisContainer.height =
      minimumHeight >= thisEmbed.naturalHeight
        ? minimumHeight
        : thisEmbed.naturalHeight;
  };
  embed.sendDataToFrame = data => {
    // IE9 can only send strings
    embed.container.contentWindow.postMessage(JSON.stringify(data), '*');
  };
  embed.init();
  return embed;
};

class IFrame extends React.Component {
  componentDidMount() {
    const { featuredData } = this.props;
    const id = `cr-embed-country-${featuredData.country}-${
      featuredData.data_id
    }`;
    makeCensusEmbed(id);
  }

  render() {
    const { classes, featuredData } = this.props;
    return (
      <div className={classNames(['cr-embed', classes.container])}>
        <iframe
          id={`cr-embed-country-${featuredData.country}-${
            featuredData.data_id
          }`}
          title={featuredData.title}
          src={`//localhost:8000/embed/iframe.html?geoID=country-${
            featuredData.country
          }&geoVersion=2009&chartDataID=${
            featuredData.data_id
          }&dataYear=2011&chartType=${
            featuredData.chart_type
          }&chartHeight=300&chartTitle=${
            featuredData.title
          }&initialSort=&statType=${featuredData.data_stat_type}`}
          allowFullScreen
          className={classNames(['census-reporter-embed', classes.iframe])}
        />
      </div>
    );
  }
}

IFrame.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  featuredData: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(IFrame);
