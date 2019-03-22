import { createMuiTheme } from '@material-ui/core/styles';

const FONT_FAMILY_HEADING = '"Lora", serif';
const FONT_FAMILY_TEXT = '"Muli", sans-serif';

const Theme = createMuiTheme({
  palette: {
    primary: { main: '#29a87c' },
    analysis: {
      main: '#f6fbfa' // ice-blue
    }
  },
  typography: {
    fontHeading: FONT_FAMILY_HEADING,
    h2: {
      fontFamily: FONT_FAMILY_HEADING,
      margin: '3.0625rem 0',
      fontSize: '3.375rem',
      fontWeight: 'normal',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal',
      color: 'black'
    },
    h3: {
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
    h4: {
      fontFamily: FONT_FAMILY_HEADING,
      margin: '2.375rem 0',
      fontSize: '1.875rem',
      fontWeight: 'normal',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal',
      color: '#231f20'
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
    subtitle2: {
      fontFamily: FONT_FAMILY_TEXT,
      fontSize: '1.5rem',
      fontWeight: 'normal',
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
    button: {
      fontFamily: FONT_FAMILY_TEXT,
      fontSize: '0.875rem',
      fontWeight: 'bold',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal',
      textTransform: 'none'
    },
    useNextVariants: true
  },
  props: {
    MuiButton: {
      color: 'primary',
      variant: 'contained'
    }
  },
  overrides: {
    MuiButton: {
      root: {
        borderRadius: '0.75rem',
        borderSize: '00625rem',
        width: '100%',
        '@media (min-width: 960px)': {
          // md
          width: '15.609375rem' // .75 of lg
        },
        '@media (min-width: 1280px)': {
          // lg
          width: '20.8125rem'
        }
      },
      label: {
        paddingTop: '1.125rem',
        paddingBottom: '1.0625rem'
      }
    }
  }
});

export default Theme;
