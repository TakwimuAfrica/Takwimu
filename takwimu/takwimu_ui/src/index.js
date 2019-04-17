import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

import Hero from './components/Hero';
import Navigation from './components/Navigation';
import ProfileDetail from './components/ProfileDetail';
import Profile from './components/Profile';
import MakingOfTakwimu from './components/MakingOfTakwimu';
import WhatCanYouDo from './components/WhatCanYouDo';
import HomeWhereToNext, { About as AboutWhereToNext } from './components/Next';
import FeaturedAnalysis from './components/FeaturedAnalysis';
import AnalysisPage from './pages/AnalysisPage';
import FeaturedData from './components/FeaturedData';
import RelatedContent from './components/RelatedContent';
import Footer from './components/Footer';
import LatestNewsStories from './components/LatestNewsStories';

import AboutUs from './components/AboutUs';

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
    fetch(
      `${
        PROPS.takwimu.url
      }/api/v2/pages/?type=takwimu.IndexPage&fields=*&format=json`
    )
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
    renderApp(ProfileDetail, 'takwimuProfileDetail');
    renderApp(Profile, 'takwimuProfile');
  }
};

const renderAboutPage = () => {
  const el = document.getElementById('takwimuWhereToNext');
  if (el) {
    renderApp(AboutUs, 'takwimuAboutUs');
    renderApp(AboutWhereToNext, 'takwimuWhereToNext');
    renderApp(RelatedContent, 'takwimuRelatedContent');
  }
};

// Render common elements
renderApp(Navigation, 'takwimuNavigation');
renderApp(Footer, 'takwimuFooter');

// Render specific pages
renderAboutPage();
renderDatabyTopicPage();
renderAnalysisPage();
renderHomepage();
