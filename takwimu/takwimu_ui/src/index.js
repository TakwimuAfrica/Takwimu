import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

import MakingOfTakwimu from './components/MakingOfTakwimu';
import WhatCanYouDo from './components/WhatCanYouDo';
import WhereToNext from './components/WhereToNext';

const renderApp = (Component, id) => {
  const el = document.getElementById(id);
  if (el) {
    const App = withRoot(Component);

    ReactDOM.render(<App />, el);
  }
};

renderApp(MakingOfTakwimu, 'takwimuMakingOf');
renderApp(WhatCanYouDo, 'takwimuWhatCanYouDo');
renderApp(WhereToNext, 'takwimuWhereToNext');
