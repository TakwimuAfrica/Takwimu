import React from 'react';
import PropTypes from 'prop-types';

import classNames from 'classnames';

import { Drawer, withStyles } from '@material-ui/core';
import DropDownButton from './DropDownButton';

import DataByTopic from './DataByTopic';
import CountryAnalysis from './CountryAnalysis';

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
  modalTopic: {
    top: '15.313rem',
    [theme.breakpoints.up('md')]: {
      top: '0'
    }
  },
  modalAnalysis: {
    top: '11.313rem',
    [theme.breakpoints.up('md')]: {
      top: '0'
    }
  },
  backdrop: {
    marginTop: '17.313rem',
    [theme.breakpoints.up('md')]: {
      marginTop: '0'
    },
    backgroundColor: 'transparent'
  },
  drawer: {
    backgroundColor: theme.palette.primary.main,
    outline: 'none'
  }
});

function DropDownDrawerComponent({
  classes,
  children,
  countries,
  active,
  toggle
}) {
  return (
    <Drawer
      anchor="top"
      ModalProps={{
        className: classNames({
          [classes.modalTopic]: active === 'topic',
          [classes.modalAnalysis]: active === 'analysis'
        })
      }}
      BackdropProps={{
        className: classes.backdrop
      }}
      PaperProps={{
        className: classes.drawer
      }}
      open={active !== null}
      elevation={0}
      transitionDuration={0}
      onEscapeKeyDown={toggle}
      onBackdropClick={toggle}
    >
      {children}
      {active === 'topic' ? <DataByTopic countries={countries} /> : null}
      {active === 'analysis' ? <CountryAnalysis countries={countries} /> : null}
    </Drawer>
  );
}

DropDownDrawerComponent.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  countries: PropTypes.arrayOf(PropTypes.shape({}).isRequired).isRequired,
  active: PropTypes.string,
  toggle: PropTypes.func.isRequired,
  children: PropTypes.oneOfType([
    PropTypes.arrayOf(PropTypes.node),
    PropTypes.node
  ]).isRequired
};

DropDownDrawerComponent.defaultProps = {
  active: null
};

const DropDownDrawer = withStyles(styles)(DropDownDrawerComponent);
export { DropDownDrawer };

function DropDowns({ classes, active, page, toggle }) {
  return (
    <div className={classes.root}>
      <DropDownButton
        isActive={active === 'analysis'}
        isHighlighted={page.id === 'analysis'}
        title="Country Analysis"
        icon={analysisIcon}
        iconActive={analysisIconActive}
        handleClick={toggle('analysis')}
      />
      <DropDownButton
        isActive={active === 'topic'}
        isHighlighted={page.id === 'topic'}
        title="Data by Topic"
        icon={topicIcon}
        iconActive={topicIconActive}
        handleClick={toggle('topic')}
      />
    </div>
  );
}

DropDowns.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  active: PropTypes.string,
  toggle: PropTypes.func.isRequired,
  page: PropTypes.shape({})
};

DropDowns.defaultProps = {
  active: null,
  page: null
};

export default withStyles(styles)(DropDowns);
