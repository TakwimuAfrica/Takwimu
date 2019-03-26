import React from 'react';
import PropTypes from 'prop-types';

import { Drawer, withStyles } from '@material-ui/core';
import DropDownButton from './DropDownButton';
import DataByTopic from './DataByTopic';

import topicIcon from '../../assets/images/a-chart-white.svg';
import topicIconActive from '../../assets/images/a-chart-active.svg';
import analysisIcon from '../../assets/images/file-paragraph.svg';
import analysisIconActive from '../../assets/images/file-paragraph-active.svg';

const styles = theme => ({
  root: {
    display: 'flex',
    flexDirection: 'column',
    justifyContent: 'flex-start',
    [theme.breakpoints.up('md')]: {
      display: 'unset'
    }
  },
  modal: {
    top: '6.313rem'
  },
  backdrop: {
    marginTop: '6.313rem',
    backgroundColor: 'transparent'
  },
  drawer: {
    backgroundColor: theme.palette.primary.main,
    outline: 'none'
  }
});
class DropDowns extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      isActive: null
    };
  }

  toggle(dropdown) {
    return () => {
      this.setState(prevState => ({
        isActive: prevState.isActive !== dropdown ? dropdown : null
      }));
    };
  }

  render() {
    const { classes } = this.props;
    const { isActive } = this.state;
    return (
      <div className={classes.root}>
        <DropDownButton
          isActive={isActive === 'analysis'}
          title="Country Analysis"
          icon={analysisIcon}
          iconActive={analysisIconActive}
          handleClick={this.toggle('analysis')}
        />
        <DropDownButton
          isActive={isActive === 'topic'}
          title="Data by Topic"
          icon={topicIcon}
          iconActive={topicIconActive}
          handleClick={this.toggle('topic')}
        />

        <Drawer
          anchor="top"
          ModalProps={{
            className: classes.modal
          }}
          BackdropProps={{
            className: classes.backdrop
          }}
          PaperProps={{
            className: classes.drawer
          }}
          open={isActive !== null}
          elevation={0}
          transitionDuration={0}
          onEscapeKeyDown={this.toggle(null)}
          onBackdropClick={this.toggle(null)}
        >
          {isActive === 'topic' ? <DataByTopic /> : null}
          {isActive === 'analysis' ? null : null}
        </Drawer>
      </div>
    );
  }
}

DropDowns.propTypes = {
  classes: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(DropDowns);
