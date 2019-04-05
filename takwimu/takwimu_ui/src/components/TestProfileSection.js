/* eslint-disable react/no-danger */
import React from 'react';

import Section from './Section';

class Test extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      sections: []
    };
  }

  componentDidMount() {
    fetch(
      `${
        process.env.REACT_APP_TAKWIMU_WAGTAIL_API_URL
      }/pages/?type=takwimu.ProfileSectionPage&fields=body&format=json`
    )
      .then(response => response.json())
      .then(json => this.setState({ sections: json.items }));
  }

  render() {
    const { sections } = this.state;
    return sections.map(section => (
      <Section title={section.title}>
        <div dangerouslySetInnerHTML={{ __html: section.body[0].value.body }} />
        <div
          dangerouslySetInnerHTML={{
            __html:
              section.body[0].value.indicators[0].value.widgets[0].value
                .raw_html
          }}
        />
      </Section>
    ));
  }
}

export default Test;
