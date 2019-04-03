import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

import Navigation from './components/Navigation';
import MakingOfTakwimu from './components/MakingOfTakwimu';
import WhatCanYouDo from './components/WhatCanYouDo';
import WhereToNext from './components/WhereToNext';
import FeaturedAnalysis from './components/FeaturedAnalysis';
import FeaturedData from './components/FeaturedData';
import Footer from './components/Footer';

const PROPS = {
  takwimu: window.takwimu,
  settings: window.settings
};

const renderApp = (Component, id) => {
  const el = document.getElementById(id);
  if (el) {
    const App = withRoot(Component);

    ReactDOM.render(<App {...PROPS} />, el);
  }
};

renderApp(Navigation, 'takwimuNavigation');
renderApp(FeaturedAnalysis, 'takwimuFeaturedAnalysis');
renderApp(FeaturedData, 'takwimuFeaturedData');
renderApp(MakingOfTakwimu, 'takwimuMakingOf');
renderApp(WhatCanYouDo, 'takwimuWhatCanYouDo');
renderApp(WhereToNext, 'takwimuWhereToNext');
renderApp(Footer, 'takwimuFooter');
