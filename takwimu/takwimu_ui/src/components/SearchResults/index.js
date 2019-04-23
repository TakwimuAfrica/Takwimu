import React from 'react';
import { withStyles } from '@material-ui/core/styles';
import MakingOfTakwimu from '../MakingOfTakwimu';

const styles = () => ({
  root: {}
});

function SearchResults() {
  return <MakingOfTakwimu />;
}

export default withStyles(styles)(SearchResults);
