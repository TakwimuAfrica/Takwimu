import { createMuiTheme } from '@material-ui/core/styles';

const FONT_FAMILY_HEADING = '"Lora", "serif"';
const FONT_FAMILY_BODY = '"Muli"';

const Theme = createMuiTheme({
  palette: {
    primary: { main: '#29a87c' },
    iceBlue: '#f6fbfa'
  },
  typography: {
    fontHeading: FONT_FAMILY_HEADING,
    fontBody: FONT_FAMILY_BODY,
    h1: {
      fontFamily: FONT_FAMILY_HEADING,
      margin: '3.063rem 0',
      fontSize: '3.375rem',
      fontWeight: 'normal',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal',
      color: 'black'
    },
    h2: {
      fontFamily: FONT_FAMILY_HEADING,
      margin: '2.375rem 0',
      fontSize: '2.375rem',
      fontWeight: 'normal',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal',
      color: 'black'
    },
    body1: {
      fontFamily: FONT_FAMILY_BODY,
      fontSize: '1.25rem',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal'
    },
    body2: {
      fontFamily: FONT_FAMILY_BODY,
      fontSize: '1.25rem',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: '2.05',
      letterSpacing: 'normal'
    }
  }
});

export default Theme;
