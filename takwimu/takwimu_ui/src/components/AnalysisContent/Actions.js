import React from 'react';

import { ButtonBase, Typography, withStyles } from '@material-ui/core';
import { PropTypes } from 'prop-types';

// import * as JSPDF from 'jspdf';
import html2canvas from 'html2canvas';

import shareIcon from '../../assets/images/analysis/share.svg';
import downloadIcon from '../../assets/images/analysis/download.svg';

const styles = {
  root: {
    padding: '30px',
    display: 'flex',
    flexDirection: 'row',
    '& > *': {
      marginRight: '50px'
    },
    '& > button:last-child': {
      marginRight: '0'
    }
  },
  actionIcon: {
    marginRight: '21px'
  },
  lastUpdated: {
    fontSize: '0.875rem',
    fontStyle: 'italic'
  },
  shareButton: {
    fontSize: '0.813rem',
    color: '#848484'
  }
};

function Actions({ classes, hideLastUpdated }) {
  const downloadAnalysis = () => {
    html2canvas(document.getElementById('analysis'), {
      ignoreElements: e =>
        e.id === 'analysis-actions' ||
        e.id === 'analysis-navigation' ||
        e.id === 'analysis-footer' ||
        e.id === 'data-actions'
    }).then(obj => {
      //   const pdf = new JSPDF('l', 'pt', 'a4');
      //   const pdfConf = {
      //     pagesplit: false,
      //     background: '#fff'
      //   };
      //   document.body.appendChild(obj); // appendChild is required for html to add page in pdf
      //   pdf.addHTML(obj, 0, 0, pdfConf, () => {
      //     document.body.removeChild(obj);
      //     pdf.save(`analysis.pdf`);
      //   });

      const link = document.createElement('a');
      link.download = `analysis.png`;
      link.href = obj.toDataURL('image/png');
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
    });
  };
  return (
    <div className={classes.root}>
      {!hideLastUpdated && (
        <Typography className={classes.lastUpdated}>
          Last Updated: <strong>18th December 2018</strong>
        </Typography>
      )}
      <ButtonBase className={classes.shareButton}>
        <img alt="share" src={shareIcon} className={classes.actionIcon} />
        Share this analysis
      </ButtonBase>
      <ButtonBase
        className={classes.shareButton}
        onClick={() => downloadAnalysis()}
      >
        <img alt="download" src={downloadIcon} className={classes.actionIcon} />
        Download this analysis (PDF 800kb)
      </ButtonBase>
    </div>
  );
}

Actions.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  hideLastUpdated: PropTypes.bool
};

Actions.defaultProps = {
  hideLastUpdated: false
};

export default withStyles(styles)(Actions);
