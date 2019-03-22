import { createMuiTheme } from '@material-ui/core/styles';

const FONT_FAMILY_HEADING = '"Lora", serif';
const FONT_FAMILY_TEXT = '"Muli", sans-serif';

const Theme = createMuiTheme({
  palette: {
    primary: { main: '#29a87c' }
  },
  typography: {
    fontHeading: FONT_FAMILY_HEADING,
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
    subtitle1: {
      fontFamily: FONT_FAMILY_TEXT,
      fontSize: '1.75rem',
      fontWeight: 'bold',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal'
    },
    body1: {
      fontFamily: FONT_FAMILY_TEXT,
      fontSize: '1.25rem',
      fontWeight: 'normal',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: '2.05',
      letterSpacing: 'normal'
    },
    useNextVariants: true
  }
});

export default Theme;
