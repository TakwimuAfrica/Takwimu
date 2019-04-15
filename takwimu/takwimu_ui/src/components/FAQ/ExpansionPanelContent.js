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

import Add from '@material-ui/icons/Add';
import Minimize from '@material-ui/icons/Minimize';

const styles = theme => ({
  root: {
    padding: '2rem 0'
  },
  activeSummary: {
    backgroundColor: theme.palette.primary.main
  },
  inactiveSummary: {
    backgroundColor: theme.palette.background.default
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
  icon: { textAlign: 'center' }
});

class PanelContent extends React.Component {
  constructor(props) {
    super(props);
    this.state = { isDetailView: false };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    this.setState(state => ({
      isDetailView: !state.isDetailView
    }));
  }

  render() {
    const { classes, expandTitle, expandDetails } = this.props;
    const { isDetailView } = this.state;
    return (
      <ExpansionPanel>
        <ExpansionPanelSummary
          className={classes.inactiveSummary}
          expandIcon={
            <IconButton className={classes.icon} onClick={this.handleClick}>
              {isDetailView ? <Minimize /> : <Add />}
            </IconButton>
          }
        >
          <Typography
            variant="body1"
            className={classes.inactiveSummaryTitle}
            onClick={this.handleClick}
          >
            {expandTitle}
          </Typography>
        </ExpansionPanelSummary>
        <ExpansionPanelDetails>
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
