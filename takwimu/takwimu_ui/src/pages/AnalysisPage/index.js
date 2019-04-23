import React from 'react';
import { PropTypes } from 'prop-types';

import { Grid, withStyles } from '@material-ui/core';

import AnalysisContent from '../../components/AnalysisContent';
import AnalysisTableOfContent from '../../components/AnalysisContent/TableOfContent';
import Section from '../../components/Section';

const styles = theme => ({
  root: {},
  aside: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '10.5rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '14rem'
    }
  },
  main: {
    width: '100%',
    [theme.breakpoints.up('md')]: {
      width: '44.671875rem' // .75 of lg
    },
    [theme.breakpoints.up('lg')]: {
      width: '59.5625rem'
    }
  }
});

class AnalysisPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      id: null,
      analysis: null,
      current: 0,
      topicIndex: 0
    };

    this.changeContent = this.changeContent.bind(this);
    this.changeTopic = this.changeTopic.bind(this);
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
    this.setState({ current: contentIndex, topicIndex: 0 });
    window.scrollTo(0, 0);
  }

  changeTopic(topicIndex) {
    this.setState({ topicIndex });
    window.scrollTo(0, 0);
  }

  render() {
    const { analysis, current, topicIndex } = this.state;
    const { classes, takwimu } = this.props;
    return analysis !== null ? (
      <Section>
        <Grid container justify="space-between">
          <div className={classes.aside}>
            <AnalysisTableOfContent
              country={takwimu.country}
              content={analysis}
              current={current}
              onChangeContent={this.changeContent}
            />
          </div>
          <div className={classes.main}>
            <AnalysisContent
              content={analysis[current]}
              onChange={this.changeTopic}
              takwimu={takwimu}
              topicIndex={topicIndex}
            />
          </div>
        </Grid>
      </Section>
    ) : null;
  }
}

AnalysisPage.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisPage);
