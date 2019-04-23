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

class IFrame extends React.Component {
  constructor(props) {
    super(props);

    const { featuredData } = props;
    const id = `cr-embed-country-${featuredData.country}-${
      featuredData.data_id
    }`;
    this.state = { id };
    this.handleFrameLoad = this.handleFrameLoad.bind(this);
  }

  componentDidMount() {
    const { id } = this.state;
    const iframe = document.getElementById(id);
    iframe.addEventListener('load', this.handleFrameLoad, true);
  }

  handleFrameLoad() {
    const { id } = this.state;
    const iframe = document.getElementById(id);
    // eslint-disable-next-line no-return-assign, no-param-reassign
    const hideFooter = n => (n.style = 'display: none');
    iframe.contentWindow.document.body.style.background = 'none';
    iframe.contentWindow.document
      .querySelectorAll('.embed-footer')
      .forEach(hideFooter);
  }

  render() {
    const { classes, featuredData } = this.props;
    const { id } = this.state;

    return (
      <div className={classNames(['cr-embed', classes.container])}>
        <iframe
          id={id}
          title={featuredData.title}
          src={`/embed/iframe.html?geoID=country-${
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
