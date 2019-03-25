import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

import Navigation from './components/Navigation';
import MakingOfTakwimu from './components/MakingOfTakwimu';
import WhereToNext from './components/WhereToNext';
import FeaturedAnalysis from './components/FeaturedAnalysis';

const renderApp = (Component, id) => {
  const el = document.getElementById(id);
  if (el) {
    const App = withRoot(Component);

    ReactDOM.render(<App />, el);
  }
};

renderApp(Navigation, 'takwimuNavigation');
renderApp(FeaturedAnalysis, 'takwimuFeaturedAnalysis');
renderApp(MakingOfTakwimu, 'takwimuMakingOf');
renderApp(WhereToNext, 'takwimuWhereToNext');
