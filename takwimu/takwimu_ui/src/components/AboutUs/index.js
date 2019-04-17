import React from 'react';
import { Grid } from '@material-ui/core';
import { withStyles } from '@material-ui/core/styles';

import Section from '../Section';
import SideMenu from './SideMenu';

const styles = theme => ({
  sideMenuRoot: {
    position: 'relative',
    display: 'flex',
    justifyContent: 'flex-start',
    width: '100%',
    height: '34rem',
    padding: '1.438rem',
    flexDirection: 'column',
    alignItems: 'flex-start',
    [theme.breakpoints.up('md')]: {
      position: 'fixed',
      width: '14.375rem'
    }
  },
  sideMenuHeader: {
    fontColor: theme.palette.info.other
  },
  activePageIndicator: {
    marginLeft: '-1.5rem',
    marginRight: '1rem'
  },
  listItem: {
    decorator: 'none',
    padding: '0.625rem 0',
    fontWeight: 'bold'
  },
  activeLink: {
    textDecoration: 'underline'
  }
});

const content = [
  { title: 'About Takwimu', link: 'about' },
  { title: 'Methodology', link: 'methodology' },
  { title: 'Services', link: 'services' },
  { title: 'FAQs', link: 'faqs' }
];

function AboutUs() {
  return (
    <Section>
      <Grid container justify="space-between">
        <Grid item container xs="12" md="3">
          <SideMenu activeContent="methodology" content={content} />
        </Grid>
        <Grid item container xs="12" md="9" />
      </Grid>
    </Section>
  );
}

export default withStyles(styles)(AboutUs);
