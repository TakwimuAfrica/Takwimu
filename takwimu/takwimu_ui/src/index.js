import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

import Hero from './components/Hero';
import Navigation from './components/Navigation';
import ProfileDetail from './components/ProfileDetail';
import Profile from './components/Profile';
import MakingOfTakwimu from './components/MakingOfTakwimu';
import WhatCanYouDo from './components/WhatCanYouDo';
import WhereToNext from './components/WhereToNext';
import FeaturedAnalysis from './components/FeaturedAnalysis';
import FeaturedData from './components/FeaturedData';
import Footer from './components/Footer';
import LatestNewsStories from './components/LatestNewsStories';
import ViewAnalysis from './components/ViewAnalysis';

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
  fetch(
    `${
      PROPS.takwimu.url
    }/api/v2/pages/?type=takwimu.IndexPage&fields=featured_analysis,featured_data&format=json`
  )
    .then(response => response.json())
    .then(data => {
      if (data.items && data.items.length) {
        const {
          featured_analysis: featuredAnalysis,
          featured_data: featuredData
        } = data.items[0];
        const props = Object.assign({}, PROPS, {
          takwimu: {
            featured_analysis: featuredAnalysis,
            featured_data: featuredData
          }
        });
        renderApp(FeaturedAnalysis, 'takwimuFeaturedAnalysis', props);
        renderApp(FeaturedData, 'takwimuFeaturedData', props);
      }
    });
  renderApp(Hero, 'takwimuHero');
  renderApp(WhatCanYouDo, 'takwimuWhatCanYouDo');
  renderApp(MakingOfTakwimu, 'takwimuMakingOf');
  renderApp(LatestNewsStories, 'takwimuLatestNewsStories');
  renderApp(WhereToNext, 'takwimuWhereToNext');
};

const renderDatabyTopicPage = () => {
  renderApp(ProfileDetail, 'takwimuProfileDetail');
  renderApp(Profile, 'takwimuProfile');
};

const renderCountryAnalysisPage = () => {
  renderApp(ViewAnalysis, 'takwimuViewAnalysis');
};

// Render common elements
renderApp(Navigation, 'takwimuNavigation');
renderApp(Footer, 'takwimuFooter');

// Render specific pages
renderHomepage();
renderDatabyTopicPage();
renderCountryAnalysisPage();
