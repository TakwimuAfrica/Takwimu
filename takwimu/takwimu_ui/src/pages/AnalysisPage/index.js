import React from 'react';

import { Grid } from '@material-ui/core';
import { PropTypes } from 'prop-types';
import Section from '../../components/Section';
import AnalysisContent from '../../components/AnalysisContent';

import AnalysisTableOfContent from '../../components/AnalysisContent/TableOfContent';

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
    const {
      takwimu: {
        country: { slug }
      }
    } = this.props;
    fetch(
      `/api/v2/pages/?type=takwimu.ProfilePage&slug=${slug}&format=json`
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
    const {
      takwimu: {
        country: { slug }
      }
    } = this.props;

    fetch(
      `/api/v2/pages/?type=takwimu.ProfilePage&fields=body&slug=${slug}&format=json`
    ).then(response => {
      if (response.status === 200) {
        response.json().then(json => {
          const { items: analysis } = json;
          if (analysis && analysis.length) {
            analysis[0].title = 'Country Overview';
          }
          this.setState({ analysis });
          this.fetchSectionAnalysis();
        });
      }
    });
  }

  fetchSectionAnalysis() {
    const {
      profile: { id }
    } = this.state;

    fetch(
      `/api/v2/pages/?type=takwimu.ProfileSectionPage&fields=body&descendant_of=${id}&format=json`
    ).then(response => {
      if (response.status === 200) {
        response.json().then(json => {
          const {
            takwimu: {
              country: { slug }
            }
          } = this.props;
          const paths = window.location.pathname.split(`/profiles/${slug}/`);
          let current = 0;
          if (paths.length === 2) {
            const sectionSlug = paths[1].replace('/', '');
            current = json.items.findIndex(
              item => item.meta.slug === sectionSlug
            );
          }
          this.setState(prevState => {
            let { analysis } = prevState;
            if (current === -1) {
              ({ current } = prevState);
            }
            if (analysis) {
              analysis = Array.concat(analysis, json.items);
            }
            return { current, analysis };
          });
        });
      }
    });
  }

  changeContent(contentIndex) {
    this.setState({ current: contentIndex });
    window.scrollTo(0, 0);
  }

  render() {
    const { analysis, current } = this.state;
    const { takwimu } = this.props;
    return analysis !== null ? (
      <Section>
        <Grid container justify="space-between">
          <Grid item container xs="12" md="3">
            <AnalysisTableOfContent
              country={takwimu.country}
              content={analysis}
              current={current}
              onChangeContent={this.changeContent}
            />
          </Grid>
          <Grid item container xs="12" md="9">
            <AnalysisContent content={analysis[current]} takwimu={takwimu} />
          </Grid>
        </Grid>
      </Section>
    ) : null;
  }
}

AnalysisPage.propTypes = {
  takwimu: PropTypes.shape({}).isRequired
};
