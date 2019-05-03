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
import WhatCanYouDo from './components/WhatYouCanDoWithTakwimu';

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
          Object.assign(PROPS.takwimu.page, data.items[0]);

          renderApp(Hero, 'takwimuHero', PROPS);
          renderApp(FeaturedAnalysis, 'takwimuFeaturedAnalysis', PROPS);
          renderApp(FeaturedData, 'takwimuFeaturedData', PROPS);
          renderApp(WhatCanYouDo, 'takwimuWhatCanYouDo', PROPS);
          renderApp(MakingOfTakwimu, 'takwimuMakingOf', PROPS);
          renderApp(LatestNewsStories, 'takwimuLatestNewsStories', PROPS);
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

const renderAboutUsPage = () => {
  const el = document.getElementById('takwimuAboutUsPage');
  if (el) {
    fetch('/api/v2/pages/?type=takwimu.AboutPage&fields=*&format=json')
      .then(response => response.json())
      .then(data => {
        if (data.items && data.items.length) {
          Object.assign(PROPS.takwimu.page, data.items[0]);

          renderApp(AboutUsPage, 'takwimuAboutUsPage');
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
