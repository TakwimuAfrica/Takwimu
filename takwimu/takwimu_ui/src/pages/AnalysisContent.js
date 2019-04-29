import React, { Fragment } from 'react';
import { PropTypes } from 'prop-types';

import { withStyles, Typography, Grid } from '@material-ui/core';

import DataContainer from '../components/FeaturedData/DataContainer';

const styles = () => ({
  root: {
    maxWidth: '933px'
  },
  title: {
    margin: '37px 0 22px 19px'
  },
  body: {
    padding: '0 19px'
  },
  readNextContainer: {
    paddingBottom: '2.3125rem'
  },
  dataContainer: {
    margin: '0.625rem',
    width: 'fit-content'
  }
});

class AnalysisContentPage extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      id: null,
      analysis: null,
      topicIndex: 0,
      current: 0
    };
  }

  componentDidMount() {
    const {
      takwimu: {
        country: { slug }
      }
    } = this.props;
    fetch(
      `/api/v2/pages/?type=takwimu.ProfilePage&slug=${slug}&fields=body,related_content&format=json`
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
      `/api/v2/pages/?type=takwimu.ProfileSectionPage&fields=body,related_content&descendant_of=${id}&format=json`
    ).then(response => {
      if (response.status === 200) {
        response.json().then(json => {
          const {
            takwimu: {
              country: { slug }
            }
          } = this.props;
          const paths = window.location.pathname.split(`/analysis/${slug}/`);
          const { hash } = window.location;

          let foundIndex = -1;
          let foundTopicIndex = -1;
          if (paths.length === 2) {
            const sectionSlug = paths[1].replace('/', '');
            foundIndex = json.items.findIndex(
              item => item.meta.slug === sectionSlug
            );

            if (hash.length && foundIndex !== -1) {
              const topicId = hash.replace('#', '');
              foundTopicIndex = json.items[foundIndex].body.findIndex(
                body => body.id === topicId
              );
            }
          }
          this.setState(prevState => {
            let { current, topicIndex, analysis } = prevState;
            if (foundIndex !== -1) {
              current = foundIndex;
            }
            if (foundTopicIndex !== -1) {
              topicIndex = foundTopicIndex;
            }
            if (analysis) {
              if (foundIndex !== -1) {
                // Adjust for `Country Overview`
                current += analysis.length;
              }
              analysis = analysis.concat(json.items);
            }
            return { current, topicIndex, analysis };
          });
        });
      }
    });
  }

  render() {
    const { analysis, current, topicIndex } = this.state;
    const { classes } = this.props;
    let content = null;
    if (analysis) {
      content = analysis[current];
    }
    return analysis !== null ? (
      <Fragment>
        <div className={classes.root}>
          <Typography className={classes.title} variant="h2">
            {content.body[topicIndex].value.title}
          </Typography>
          <Grid container direction="row">
            {content.body[topicIndex].value.body.map(c => (
              <Fragment>
                {c.type === 'text' && (
                  <Typography
                    key={c.id}
                    className={classes.body}
                    dangerouslySetInnerHTML={{
                      __html: c.value
                    }}
                  />
                )}
                {c.type === 'indicator' && (
                  <DataContainer
                    key={c.id}
                    id={c.id}
                    classes={{ root: classes.dataContainer }}
                    widget={c.value.widget}
                  />
                )}
              </Fragment>
            ))}
          </Grid>
        </div>
      </Fragment>
    ) : null;
  }
}

AnalysisContentPage.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  takwimu: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(AnalysisContentPage);
