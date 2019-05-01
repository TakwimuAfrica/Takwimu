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
import WhatCanYouDo from './components/WhatCanYouDo';
import SearchResults from './components/SearchResults';
import AnalysisPage from './pages/Analysis';
import AboutUsPage from './pages/AboutUs';

const PROPS = {
  takwimu: window.takwimu,
  settings: window.settings,
  profile: window.profileData,
  search: window.search
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
          const {
            tagline,
            featured_analysis: featuredAnalysis,
            featured_data: featuredData,
            what_you_can_do_with_takwimu: whatYouCanDo,
            making_of_takwimu: makingOf,
            latest_news_stories: latestNewsStories
          } = data.items[0];
          const takwimu = Object.assign({}, PROPS.takwimu, {
            tagline,
            featured_analysis: featuredAnalysis,
            featured_data: featuredData,
            what_you_can_do_with_takwimu: whatYouCanDo,
            making_of_takwimu: makingOf,
            latest_news_stories: latestNewsStories
          });
          const props = Object.assign({}, PROPS, { takwimu });

          renderApp(Hero, 'takwimuHero', props);
          renderApp(FeaturedAnalysis, 'takwimuFeaturedAnalysis', props);
          renderApp(FeaturedData, 'takwimuFeaturedData', props);
          renderApp(WhatCanYouDo, 'takwimuWhatCanYouDo', props);
          renderApp(MakingOfTakwimu, 'takwimuMakingOf', props);
          renderApp(LatestNewsStories, 'takwimuLatestNewsStories', props);
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
          const {
            content,
            methodology,
            related_content: relatedContent
          } = data.items[0];
          const takwimu = Object.assign({}, PROPS.takwimu, {
            content,
            methodology,
            related_content: relatedContent
          });
          const props = Object.assign({}, PROPS, { takwimu });
          renderApp(AboutUsPage, 'takwimuAboutUsPage', props);
        }
      });
  }
};

const renderSearchResultsPage = () => {
  const el = document.getElementById('takwimuSearchResults');
  if (el) {
    const { searchQuery } = PROPS.search;
    fetch(`/api/search/?q=${searchQuery}&format=json`)
      .then(response => response.json())
      .then(data => {
        if (data.length) {
          const searchResults = data;
          const search = Object.assign({}, PROPS.search, {
            searchResults
          });
          const props = Object.assign({}, PROPS, { search });

          renderApp(SearchResults, 'takwimuSearchResults', props);
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
renderSearchResultsPage();
