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
import { faPlus, faMinus } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

const styles = theme => ({
  panel: {
    paddingBottom: '0.5rem',
    '&::before': {
      content: '',
      backgroundColor: 'transparent'
    }
  },
  activeExpandSummary: {
    backgroundColor: theme.palette.primary.main
  },
  inactiveExpandSummary: {
    backgroundColor: theme.palette.info.main
  },
  inactiveExpandSummaryTitle: {
    color: theme.palette.primary.main,
    margin: '0.5rem',
    fontWeight: 600
  },
  activeExpandSummaryTitle: {
    color: 'white',
    margin: '0.5rem',
    fontWeight: 600
  },
  iconMinus: { color: 'white' }
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
      ? `${classes.inactiveExpandSummary}`
      : `${classes.activeExpandSummary}`;

    const AddTxtColor = txtColor
      ? `${classes.inactiveExpandSummaryTitle}`
      : `${classes.activeExpandSummaryTitle}`;

    return (
      <ExpansionPanel square className={classes.panel}>
        <ExpansionPanelSummary
          className={AddBgColor}
          onClick={this.handleChange}
          expandIcon={
            <IconButton className={this.handleChange}>
              {iconChange ? (
                <FontAwesomeIcon icon={faPlus} />
              ) : (
                <FontAwesomeIcon icon={faMinus} className={classes.iconMinus} />
              )}
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
        <ExpansionPanelDetails className={classes.inactiveExpandSummary}>
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
