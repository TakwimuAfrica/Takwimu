import React from 'react';

import { Grid } from '@material-ui/core';
import Section from '../../components/Section';
import AnalysisContent from './AnalysisContent';
import AnalysisPageNav from './AnalysisPageNav';
import AnalysisTableOfContent from './AnalysisTableOfContent';

export default class AnalysisPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      analysis: null,
      current: 0
    };

    this.changeContent = this.changeContent.bind(this);
  }

  componentDidMount() {
    fetch(
      'http://localhost:8000/api/v2/pages/?type=takwimu.ProfilePage&fields=body,title&title=Nigeria&format=json'
    ).then(response => {
      if (response.status === 200) {
        response
          .json()
          .then(json => this.setState({ analysis: json.items[0] }));
      }
    });
  }

  changeContent(contentIndex) {
    this.setState({ current: contentIndex });
  }

  render() {
    const { analysis, current } = this.state;
    return (
      <React.Fragment>
        <AnalysisPageNav />
        {analysis && (
          <Section>
            <Grid container justify="space-between">
              <Grid item>
                <AnalysisTableOfContent
                  content={analysis}
                  current={current}
                  onChangeContent={this.changeContent}
                />
              </Grid>
              <Grid item>
                <AnalysisContent content={analysis.body[current]} />
              </Grid>
            </Grid>
          </Section>
        )}
      </React.Fragment>
    );
  }
}
