import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

import Navigation from './components/Navigation';
import MakingOfTakwimu from './components/MakingOfTakwimu';
import WhatCanYouDo from './components/WhatCanYouDo';
import HomeWhereToNext from './components/WhereToNext/HomeWhereToNextindex';
import FeaturedAnalysis from './components/FeaturedAnalysis';
import FeaturedData from './components/FeaturedData';
import AboutWhereToNext from './components/WhereToNext/AboutWhereToNext';
import Footer from './components/Footer';

const props = {
  countries: window.countries
};

const renderApp = (Component, id) => {
  const el = document.getElementById(id);
  if (el) {
    const App = withRoot(Component);

    ReactDOM.render(<App {...props} />, el);
  }
};

renderApp(Navigation, 'takwimuNavigation');
renderApp(FeaturedAnalysis, 'takwimuFeaturedAnalysis');
renderApp(FeaturedData, 'takwimuFeaturedData');
renderApp(MakingOfTakwimu, 'takwimuMakingOf');
renderApp(WhatCanYouDo, 'takwimuWhatCanYouDo');
renderApp(HomeWhereToNext, 'takwimuWhereToNext');
renderApp(AboutWhereToNext, 'takwimuAboutWhereToNext');
renderApp(Footer, 'takwimuFooter');
