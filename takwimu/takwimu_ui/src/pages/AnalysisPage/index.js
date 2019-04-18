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
      id: null,
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
      `/api/v2/pages/?type=takwimu.ProfilePage&slug=${slug}&fields=body&format=json`
    ).then(response => {
      if (response.status === 200) {
        response.json().then(json => {
          const { items: analysis } = json;
          if (analysis.length) {
            analysis[0].title = 'Country Overview';
          }
          this.setState({ id: analysis[0].id, analysis }, this.fetchAnalysis);
        });
      }
    });
  }

  fetchAnalysis() {
    const { id } = this.state;

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
          let foundIndex = -1;
          if (paths.length === 2) {
            const sectionSlug = paths[1].replace('/', '');
            foundIndex = json.items.findIndex(
              item => item.meta.slug === sectionSlug
            );
          }
          this.setState(prevState => {
            let { current, analysis } = prevState;
            if (foundIndex !== -1) {
              current = foundIndex;
            }
            if (analysis) {
              if (foundIndex !== -1) {
                // Adjust for `Country Overview`
                current += analysis.length;
              }
              analysis = analysis.concat(json.items);
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
          <Grid item xs={12} md={3} container>
            <AnalysisTableOfContent
              country={takwimu.country}
              content={analysis}
              current={current}
              onChangeContent={this.changeContent}
            />
          </Grid>
          <Grid item xs={12} md={9} container>
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
