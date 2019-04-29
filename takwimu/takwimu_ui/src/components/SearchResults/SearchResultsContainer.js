import React from 'react';
import { PropTypes } from 'prop-types';
import { withStyles, ButtonBase } from '@material-ui/core';
import Typography from '@material-ui/core/Typography';
import Grid from '@material-ui/core/Grid';
import Link from '@material-ui/core/Link';
import classNames from 'classnames';
import SearchResultItem from './SearchResultItem';

const styles = theme => ({
  root: {},
  searchResultsList: {
    paddingTop: '1.5rem',
    paddingBottom: '3rem',
    marginLeft: '2.0625rem',
    marginRight: '4.3125rem'
  },
  resultsFilter: {
    paddingTop: '2rem',
    paddingBottom: '2rem',
    marginLeft: '2.0625rem',
    display: 'flex'
  },
  filter: {
    alignItems: 'center',
    justifyContent: 'flex-end',
    display: 'flex',
    width: '70%'
  },
  showResult: {
    width: '30%'
  },
  filterItem: {
    display: 'inline-block',
    marginLeft: '1rem',
    textDecoration: 'underline'
  },
  filterActive: {
    color: theme.palette.text.primary,
    textDecoration: 'none'
  },
  filterItemLabel: {
    display: 'inline-block'
  },
  paginationContainer: {
    padding: '3rem'
  },
  pagginationButton: {
    color: theme.palette.primary.main,
    fontSize: theme.typography.body2.fontSize
  },
  borderDiv: {
    borderStyle: 'solid',
    borderBottom: '4px',
    borderColor: theme.palette.primary.main
  },
  pagesList: {
    marginTop: '1rem'
  }
});

function RenderPaginator({
  classes,
  items,
  activePage,
  handleNextClick,
  handlePreviousClick
}) {
  const numPages = Math.floor(items / 10) + 1;
  const pages = Array.from({ length: numPages }, (v, k) => k + 1);

  return (
    <div className={classes.pagesList}>
      {activePage > 0 ? (
        <ButtonBase
          className={classNames([
            classes.filterItem,
            classes.pagginationButton
          ])}
          onClick={handlePreviousClick}
        >
          Previous
        </ButtonBase>
      ) : null}
      {pages.map(page => (
        <Link
          className={classNames([
            classes.filterItem,
            { [classes.filterActive]: page === activePage + 1 }
          ])}
          href="/search"
        >
          {page}
        </Link>
      ))}
      <ButtonBase
        className={classNames([classes.filterItem, classes.pagginationButton])}
        onClick={handleNextClick}
      >
        Next
      </ButtonBase>
    </div>
  );
}
RenderPaginator.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  items: PropTypes.number.isRequired,
  activePage: PropTypes.number.isRequired,
  handleNextClick: PropTypes.func.isRequired,
  handlePreviousClick: PropTypes.func.isRequired
};
export const Paginator = withStyles(styles)(RenderPaginator);

class SearchResultsContainer extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      activePage: 1,
      startIndex: 10
    };

    this.handleNextClick = this.handleNextClick.bind(this);
    this.handlePreviousClick = this.handlePreviousClick.bind(this);
  }

  handleNextClick() {
    this.setState(prevState => ({
      activePage: prevState.activePage + 1,
      startIndex: prevState.startIndex + 10
    }));
  }

  handlePreviousClick() {
    this.setState(prevState => ({
      activePage: prevState.activePage - 1,
      startIndex: prevState.startIndex - 10
    }));
  }

  render() {
    const {
      classes,
      results: { items }
    } = this.props;
    const { activePage, startIndex } = this.state;

    let resultIndexText = '';
    const resultsLength = items.length;
    let endIndex = 0;

    if (resultsLength > 10) {
      endIndex = startIndex + 10 * (activePage + 1);

      if (resultsLength - startIndex < 10) {
        endIndex = startIndex + (resultsLength - startIndex);
      }
      resultIndexText = `Results ${startIndex + 1} - ${endIndex} of `;
    }
    return (
      <div className={classes.root}>
        <Grid className={classes.resultsFilter}>
          <Typography item variant="body2" className={classes.showResult}>
            {`Showing ${resultIndexText}${items.length} results`}
          </Typography>
          <Grid item className={classes.filter}>
            <Typography
              item
              variant="body2"
              color="inherit"
              className={classes.filterItemLabel}
            >
              Show:
            </Typography>
            <Link className={classes.filterItem} href="/search">
              All Results
            </Link>
            <Link className={classes.filterItem} href="/search">
              Analysis Results
            </Link>
            <Link className={classes.filterItem} href="/search">
              Data Results
            </Link>
          </Grid>
        </Grid>
        <div className={classes.borderDiv} />
        <div className={classes.searchResultsList}>
          {items.slice(startIndex, endIndex).map(result => (
            <SearchResultItem
              resultType="Analysis"
              country={result.country}
              link={result.url}
              title={result.title}
              summary={result.summary}
              key={result.id}
            />
          ))}
        </div>
        <div className={classes.borderDiv} />

        <div className={classes.paginationContainer}>
          <Typography variant="body2">
            {`Showing ${resultIndexText}${items.length} results`}
          </Typography>
          <Paginator
            items={items.length}
            activePage={activePage}
            handleNextClick={this.handleNextClick}
            handlePreviousClick={this.handlePreviousClick}
          />
        </div>
      </div>
    );
  }
}

SearchResultsContainer.propTypes = {
  classes: PropTypes.shape({}).isRequired,
  results: PropTypes.shape({}).isRequired
};

export default withStyles(styles)(SearchResultsContainer);
