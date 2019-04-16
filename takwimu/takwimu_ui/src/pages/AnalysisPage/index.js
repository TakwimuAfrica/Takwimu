import React from 'react';

import { Grid } from '@material-ui/core';
import { PropTypes } from 'prop-types';
import Section from '../../components/Section';
import AnalysisContent from './AnalysisContent';
import AnalysisPageNav from './ActionsNav';
import AnalysisTableOfContent from './TableOfContent';

import { Analysis as AnalysisReadNext } from '../../components/Next';
import ViewCountry from '../../components/ViewCountry';

export default class AnalysisPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      profile: null,
      analysis: null,
      current: 0
    };

    this.changeContent = this.changeContent.bind(this);
  }

  componentDidMount() {
    const { takwimu } = this.props;
    const countryName = takwimu.country.name;
    fetch(
      `${
        takwimu.url
      }/api/v2/pages/?type=takwimu.ProfilePage&title=${countryName}&format=json`
    ).then(response => {
      if (response.status === 200) {
        response
          .json()
          .then(json =>
            this.setState({ profile: json.items[0] }, this.fetchAnalysis)
          );
      }
    });
  }

  fetchAnalysis() {
    const { takwimu } = this.props;
    const { profile } = this.state;

    fetch(
      `${
        takwimu.url
      }/api/v2/pages/?type=takwimu.ProfileSectionPage&fields=body&descendant_of=${
        profile.id
      }&format=json`
    ).then(response => {
      if (response.status === 200) {
        response.json().then(json => this.setState({ analysis: json.items }));
      }
    });
  }

  changeContent(contentIndex) {
    this.setState({ current: contentIndex });
  }

  render() {
    const { profile, analysis, current } = this.state;
    const { takwimu } = this.props;
    return (
      <React.Fragment>
        <AnalysisPageNav />
        {analysis && (
          <Section>
            <Grid container justify="space-between">
              <Grid item container xs="12" md="3">
                <AnalysisTableOfContent
                  profile={profile}
                  content={analysis}
                  current={current}
                  onChangeContent={this.changeContent}
                />
              </Grid>
              <Grid item container xs="12" md="9">
                <AnalysisContent content={analysis[current]} />
                <ViewCountry takwimu={takwimu} />
                <AnalysisReadNext />
              </Grid>
            </Grid>
          </Section>
        )}
      </React.Fragment>
    );
  }
}

AnalysisPage.propTypes = {
  takwimu: PropTypes.shape({}).isRequired
};
