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

const PROPS = {
  takwimu: window.takwimu,
  settings: window.settings,
  profile: window.profileData
};
const renderApp = (Component, id) => {
  const el = document.getElementById(id);
  if (el) {
    const App = withRoot(Component);

    ReactDOM.render(<App {...PROPS} />, el);
  }
};

renderApp(Navigation, 'takwimuNavigation');
renderApp(ProfileDetail, 'takwimuProfileDetail');
renderApp(Hero, 'takwimuHero');
renderApp(Profile, 'takwimuProfile');
renderApp(FeaturedAnalysis, 'takwimuFeaturedAnalysis');
renderApp(FeaturedData, 'takwimuFeaturedData');
renderApp(WhatCanYouDo, 'takwimuWhatCanYouDo');
renderApp(MakingOfTakwimu, 'takwimuMakingOf');
renderApp(LatestNewsStories, 'takwimuLatestNewsStories');
renderApp(WhereToNext, 'takwimuWhereToNext');
renderApp(Footer, 'takwimuFooter');
