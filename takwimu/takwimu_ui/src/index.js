import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

const renderApp = (Component, id) => {
    const el = document.getElementById(id);
    if (el) {
        ReactDOM.render(<App />, el);
    }
};

