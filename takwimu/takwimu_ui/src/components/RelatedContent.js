import React from 'react';

import {
  Grid,
  List,
  ListItem,
  ListItemText,
  withStyles
} from '@material-ui/core';

import Section from './Section';

function RelatedContent() {
  return (
    <Section title="Related Content" variant="h3">
      <Grid container direction="row" justify="flex-start" alignItems="center">
        <Grid item xs={5}>
          <List>
            <ListItem>
              <ListItemText primary="Lorem ipsom dolor sit amec" />
            </ListItem>
            <ListItem>
              <ListItemText primary="South Africa Data visuals for politics" />
            </ListItem>
            <ListItem>
              <ListItemText primary="Source 1 lorem ipsumo" />
            </ListItem>
            <ListItem>
              <ListItemText primary="Source 2 lorem ipsum dolor" />
            </ListItem>
          </List>
        </Grid>
      </Grid>
    </Section>
  );
}

export default withStyles(RelatedContent);
