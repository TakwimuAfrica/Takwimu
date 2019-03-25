import React, { Fragment } from 'react';
import DropDownButton from './DropDownButton';

import topicIcon from '../../assets/a-chart-white.svg';
import topicIconActive from '../../assets/a-chart-active.svg';
import analysisIcon from '../../assets/file-paragraph.svg';
import analysisIconActive from '../../assets/file-paragraph-active.svg';

export default class DropDowns extends React.Component {
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
    const { isActive } = this.state;
    return (
      <Fragment>
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
      </Fragment>
    );
  }
}
