import { createMuiTheme } from '@material-ui/core/styles';

const FONT_FAMILY_HEADING = '"Lora", "serif"';

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
    body1: {
      fontFamily: 'Muli',
      fontSize: '1.25rem',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal'
    }
  }
});

export default Theme;
