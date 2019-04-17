import React from 'react';
import PropTypes from 'prop-types';
import {
  Typography,
  ExpansionPanel,
  ExpansionPanelSummary,
  withStyles,
  IconButton
} from '@material-ui/core';

const styles = theme => ({
  panel: {
    marginTop: '0.3125rem',
    marginBottom: '0.0625rem',
    '&::before': {
      content: '',
      backgroundColor: 'transparent'
    }
  },
  panelExpanded: {
    margin: '0.3125rem 0 0 0'
  },
  activeExpandSummary: {
    backgroundColor: theme.palette.primary.main
  },
  inactiveExpandSummary: {
    backgroundColor: theme.palette.background.light
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
  iconButton: {
    '&:hover': {
      backgroundColor: 'transparent'
    }
  },
  icon: {
    fontSize: '2.4375rem'
  },
  iconExpanded: { fontSize: '2.4375rem', color: 'white' }
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
    const { classes, expandTitle, children } = this.props;
    const { bgColor, txtColor, iconChange } = this.state;

    const AddBgColor = bgColor
      ? `${classes.inactiveExpandSummary}`
      : `${classes.activeExpandSummary}`;

    const AddTxtColor = txtColor
      ? `${classes.inactiveExpandSummaryTitle}`
      : `${classes.activeExpandSummaryTitle}`;

    return (
      <ExpansionPanel
        square
        classes={{ root: classes.panel, expanded: classes.panelExpanded }}
      >
        <ExpansionPanelSummary
          className={AddBgColor}
          onClick={this.handleChange}
          disableRipple
          expandIcon={
            <IconButton className={classes.iconButton}>
              {iconChange ? (
                <Typography
                  variant="subtitle1"
                  component="span"
                  className={classes.icon}
                >
                  &#43;
                </Typography>
              ) : (
                <span className={classes.iconExpanded}>&#8722;</span>
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
        {children}
      </ExpansionPanel>
    );
  }
}

PanelContent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  expandTitle: PropTypes.string,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired
};
PanelContent.defaultProps = {
  expandTitle: ''
};

export default withStyles(styles)(PanelContent);
