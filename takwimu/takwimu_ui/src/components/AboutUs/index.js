import React from 'react';
import { Grid, Typography, MenuList, Link } from '@material-ui/core';

import Section from '../Section';

function SideMenu() {
  return (
    <div>
      <Typography variant="subtitle2">Jump to:</Typography>
      <MenuList>
        {[
          { title: 'About Takwimu', link: '#about' },
          { title: 'Methodology', link: '#methodology' },
          { title: 'Services', link: '#services' },
          { title: 'FAQs', link: '#faqs' }
        ].map(item => (
          <li>
            <Link href={item.link}>{item.title}</Link>
          </li>
        ))}
      </MenuList>
    </div>
  );
}

function AboutUs() {
  return (
    <Section>
      <Grid container justify="space-between">
        <Grid item container xs="12" md="3">
          <SideMenu />
        </Grid>
        <Grid item container xs="12" md="9" />
      </Grid>
    </Section>
  );
}

export default AboutUs;
