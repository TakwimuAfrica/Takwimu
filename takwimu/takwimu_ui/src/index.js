import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

import FeaturedAnalysis from './components/FeaturedAnalysis';
import FeaturedData from './components/FeaturedData';
import Footer from './components/Footer';
import Hero from './components/Hero';
import HomeWhereToNext from './components/Next';
import Navigation from './components/Navigation';
import Profile from './components/Profile';
import ProfileDetail from './components/ProfileDetail';
import LatestNewsStories from './components/LatestNewsStories';
import MakingOfTakwimu from './components/MakingOfTakwimu';
import WhatCanYouDo from './components/WhatCanYouDo';

import AnalysisPage from './pages/Analysis';
import AboutUsPage from './pages/AboutUs';

const PROPS = {
  takwimu: window.takwimu,
  settings: window.settings,
  profile: window.profileData
};

const renderApp = (Component, id, props = PROPS) => {
  const el = document.getElementById(id);
  if (el) {
    const App = withRoot(Component);

    ReactDOM.render(<App {...props} />, el);
  }
};

const renderHomepage = () => {
  // check for anything that *must* be present on this page
  const el = document.getElementById('takwimuHero');
  if (el) {
    fetch('/api/v2/pages/?type=takwimu.IndexPage&fields=*&format=json')
      .then(response => response.json())
      .then(data => {
        if (data.items && data.items.length) {
          const {
            tagline,
            featured_analysis: featuredAnalysis,
            featured_data: featuredData,
            what_you_can_do_with_takwimu: whatYouCanDo,
            making_of_takwimu: makingOf,
            latest_news_stories: latestNewsStories
          } = data.items[0];
          const takwimu = Object.assign({}, PROPS.takwimu, {
            tagline,
            featured_analysis: featuredAnalysis,
            featured_data: featuredData,
            what_you_can_do_with_takwimu: whatYouCanDo,
            making_of_takwimu: makingOf,
            latest_news_stories: latestNewsStories
          });
          const props = Object.assign({}, PROPS, { takwimu });

          renderApp(Hero, 'takwimuHero', props);
          renderApp(FeaturedAnalysis, 'takwimuFeaturedAnalysis', props);
          renderApp(FeaturedData, 'takwimuFeaturedData', props);
          renderApp(WhatCanYouDo, 'takwimuWhatCanYouDo', props);
          renderApp(MakingOfTakwimu, 'takwimuMakingOf', props);
          renderApp(LatestNewsStories, 'takwimuLatestNewsStories', props);
        }
      });
    renderApp(HomeWhereToNext, 'takwimuWhereToNext');
  }
};

const renderAnalysisPage = () => {
  const el = document.getElementById('takwimuAnalysisPage');
  if (el) {
    renderApp(AnalysisPage, 'takwimuAnalysisPage');
  }
};

const renderDatabyTopicPage = () => {
  const el = document.getElementById('takwimuProfile');
  if (el) {
    fetch(
      `/api/v2/pages/?type=takwimu.ProfilePage&slug=${
        window.takwimu.country.slug
      }&fields=body&format=json`
    ).then(pageResponse => {
      if (pageResponse.status === 200) {
        pageResponse.json().then(pageJson => {
          let { items: analyses } = pageJson;

          fetch(
            `/api/v2/pages/?type=takwimu.ProfileSectionPage&fields=body,related_content&descendant_of=${
              analyses[0].id
            }&format=json`
          ).then(sectionResponse => {
            if (sectionResponse.status === 200) {
              sectionResponse.json().then(sectionJson => {
                const { items } = sectionJson;
                analyses = analyses.concat(items);

                const indicators = [];

                analyses.forEach(analysis =>
                  analysis.body.forEach(topic =>
                    topic.value.body
                      .filter(item => item.type === 'indicator')
                      .forEach(indicator => {
                        const analysisTitle =
                          analysis.title === window.takwimu.country.name
                            ? 'Country Overview'
                            : analysis.title;
                        const analysisSlug =
                          analysis.meta.slug === window.takwimu.country.slug
                            ? '' // Country Overview doesn't have an anaylsis slug
                            : analysis.meta.slug;
                        // Assuming:
                        //   - all indicators are unique
                        //   - an indicator belongs to only one analysis
                        //
                        // TODO: Check unique indicators
                        //       `id` will not help unless server creates indicators that are reused
                        //       Need to check example data_id for hurumap indicators
                        //       Figured out how to determine html indicators uniqueness
                        indicators.push({
                          analysis: {
                            title: analysisTitle
                          },
                          topic: {
                            title: topic.value.title,
                            summary: topic.value.summary
                          },
                          url: `/profiles/${window.takwimu.country.slug}/${
                            analysisSlug.length > 0 // Country Overview doesn't have an anaylsis slug
                              ? `${analysisSlug}#${topic.id}`
                              : `#${topic.id}`
                          }`,
                          indicator
                        });
                      })
                  )
                );

                window.takwimu.indicators = indicators;
                const props = Object.assign({}, PROPS, {
                  takwimu: Object.assign({}, PROPS.takwimu, {
                    indicators
                  })
                });
                renderApp(ProfileDetail, 'takwimuProfileDetail');
                renderApp(Profile, 'takwimuProfile', props);
              });
            }
          });
        });
      }
    });
  }
};

const renderAboutUsPage = () => {
  const el = document.getElementById('takwimuAboutUsPage');
  if (el) {
    fetch('/api/v2/pages/?type=takwimu.AboutPage&fields=*&format=json')
      .then(response => response.json())
      .then(data => {
        if (data.items && data.items.length) {
          const {
            content,
            methodology,
            related_content: relatedContent
          } = data.items[0];
          const takwimu = Object.assign({}, PROPS.takwimu, {
            content,
            methodology,
            related_content: relatedContent
          });
          const props = Object.assign({}, PROPS, { takwimu });
          renderApp(AboutUsPage, 'takwimuAboutUsPage', props);
        }
      });
  }
};

// Render common elements
renderApp(Navigation, 'takwimuNavigation');
renderApp(Footer, 'takwimuFooter');

// Render specific pages
renderAboutUsPage();
renderDatabyTopicPage();
renderAnalysisPage();
renderHomepage();
