import React from 'react';
import ReactDOM from 'react-dom';

import withRoot from './withRoot';

const renderApp = (Component, id) => {
    const el = document.getElementById(id);
    if (el) {
        const App = withRoot(Component);

        ReactDOM.render(<App />, el);
    }
};

