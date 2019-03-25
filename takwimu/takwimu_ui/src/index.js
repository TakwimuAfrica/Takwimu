import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

import MakingOfTakwimu from './components/MakingOfTakwimu';
import WhereToNext from './components/WhereToNext';
import DataByTopic from './components/Navigation/DataByTopic';

const renderApp = (Component, id) => {
  const el = document.getElementById(id);
  if (el) {
    const App = withRoot(Component);

    ReactDOM.render(<App />, el);
  }
};

renderApp(DataByTopic, 'takwimuDataByTopic');
renderApp(MakingOfTakwimu, 'takwimuMakingOf');
renderApp(WhereToNext, 'takwimuWhereToNext');
