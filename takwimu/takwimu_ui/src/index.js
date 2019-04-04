import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

import Hero from './components/Hero';
import Navigation from './components/Navigation';
import MakingOfTakwimu from './components/MakingOfTakwimu';
import WhatCanYouDo from './components/WhatCanYouDo';
import WhereToNext from './components/WhereToNext';
import FeaturedAnalysis from './components/FeaturedAnalysis';
import FeaturedData from './components/FeaturedData';
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
renderApp(Hero, 'takwimuHero');
renderApp(FeaturedAnalysis, 'takwimuFeaturedAnalysis');
renderApp(FeaturedData, 'takwimuFeaturedData');
renderApp(MakingOfTakwimu, 'takwimuMakingOf');
renderApp(WhatCanYouDo, 'takwimuWhatCanYouDo');
renderApp(WhereToNext, 'takwimuWhereToNext');
renderApp(Footer, 'takwimuFooter');
