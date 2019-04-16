import React from 'react';
import PropTypes from 'prop-types';
import {
  Typography,
  ExpansionPanel,
  ExpansionPanelSummary,
  ExpansionPanelDetails,
  withStyles,
  IconButton
} from '@material-ui/core';

import { Add, Minimize } from '@material-ui/icons';

const styles = theme => ({
  panel: {
    paddingBottom: '0.5rem',
    '&::before': {
      content: '',
      backgroundColor: 'transparent'
    }
  },
  activeSummary: {
    backgroundColor: theme.palette.primary.main
  },
  inactiveSummary: {
    backgroundColor: '#f6f6f6'
  },
  inactiveSummaryTitle: {
    color: theme.palette.primary.main,
    margin: '0.5rem',
    fontWeight: 600
  },
  activeSummaryTitle: {
    color: 'white',
    margin: '0.5rem',
    fontWeight: 600
  },
  icon: { textAlign: 'center' },
  panelDetails: {
    backgroundColor: '#f6fbfa'
  }
});

class PanelContent extends React.Component {
  constructor(props) {
    super(props);
    this.state = { bgColor: true, txtColor: true, iconChange: true };
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange(event) {
    this.setState(state => ({
      iconChange: !state.iconChange,
      bgColor: !state.bgColor,
      txtColor: !state.txtColor
    }));
    event.preventDefault();
  }

  render() {
    const { classes, expandTitle, expandDetails } = this.props;
    const { bgColor, txtColor, iconChange } = this.state;

    const AddBgColor = bgColor
      ? `${classes.inactiveSummary}`
      : `${classes.activeSummary}`;

    const AddTxtColor = txtColor
      ? `${classes.inactiveSummaryTitle}`
      : `${classes.activeSummaryTitle}`;

    return (
      <ExpansionPanel className={classes.panel}>
        <ExpansionPanelSummary
          className={AddBgColor}
          onClick={this.handleChange}
          expandIcon={
            <IconButton className={this.handleChange}>
              {iconChange ? <Add /> : <Minimize />}
            </IconButton>
          }
        >
          <Typography
            variant="body1"
            className={AddTxtColor}
            onClick={this.handleChange}
          >
            {expandTitle}
          </Typography>
        </ExpansionPanelSummary>
        <ExpansionPanelDetails className={classes.panelDetails}>
          <Typography>{expandDetails}</Typography>
        </ExpansionPanelDetails>
      </ExpansionPanel>
    );
  }
}

PanelContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  expandTitle: PropTypes.string,
  expandDetails: PropTypes.string
};
PanelContent.defaultProps = {
  expandTitle: '',
  expandDetails: ''
};

export default withStyles(styles)(PanelContent);
