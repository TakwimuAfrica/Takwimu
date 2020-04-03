import { createMuiTheme } from '@material-ui/core/styles';

const FONT_FAMILY_HEADING = '"Lora", serif';
const FONT_FAMILY_TEXT = '"Muli", sans-serif';

const Theme = createMuiTheme({
  palette: {
    primary: {
      main: '#29a87c' // dark-mint
    },
    secondary: {
      main: '#004494' // darkish-blue
    },
    text: { primary: '#000', secondary: '#fff' },
    background: {
      default: '#fff',
      light: '#f6f6f6' // light gray
    },
    info: {
      main: '#f6fbfa', // ice-blue
      other: '#9b9b9b'
    },
    data: {
      main: '#4a4a4a',
      light: '#F5F5F5' // #4a4a4a opacity 0.05
    }
  },
  typography: {
    fontHeading: FONT_FAMILY_HEADING,
    fontText: FONT_FAMILY_TEXT,
    h1: {
      fontFamily: FONT_FAMILY_HEADING,
      fontSize: '3.375rem',
      fontWeight: 'bold',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: 'normal',
      letterSpacing: 'normal',
      color: 'black'
    },
    h2: {
      fontFamily: FONT_FAMILY_HEADING,
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
    body2: {
      fontFamily: FONT_FAMILY_TEXT,
      fontSize: '1.125rem',
      fontWeight: 'normal',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: '2.05',
      letterSpacing: 'normal'
    },
    caption: {
      fontFamily: FONT_FAMILY_TEXT,
      fontSize: '0.8125rem',
      fontWeight: 'normal',
      fontStyle: 'normal',
      fontStretch: 'normal',
      lineHeight: '1.69',
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
    MuiButtonBase: {
      disableRipple: true,
      disableTouchRipple: true
    },
    MuiButton: {
      color: 'primary',
      variant: 'contained'
    },
    MuiPaper: {
      elevation: 0,
      square: true
    }
  },
  overrides: {
    MuiCssBaseline: {
      '@global': {
        '.wp-block-table': {
          fontSize: '12px'
        },
        '.wp-block-table table': {
          borderCollapse: 'collapse'
        }
      }
    },
    MuiLink: {
      root: {
        fontFamily: FONT_FAMILY_TEXT,
        fontSize: '1.125rem',
        fontWeight: 'normal',
        fontStyle: 'normal',
        fontStretch: 'normal',
        lineHeight: 'normal',
        letterSpacing: 'normal'
      }
    },
    MuiButton: {
      root: {
        borderRadius: '0.75rem',
        borderSize: '00625rem',
        width: '100%',
        padding: '0',
        '@media (min-width: 960px)': {
          // md
          width: '15.609375rem' // .75 of lg
        },
        '@media (min-width: 1280px)': {
          // lg
          width: '20.8125rem'
        }
      },
      contained: {
        boxShadow: 'none'
      },
      label: {
        paddingTop: '1.125rem',
        paddingBottom: '1.0625rem'
      }
    },
    MuiPaper: {
      elevation1: {
        boxShadow: 'none'
      }
    },
    MuiCardContent: {
      root: {
        padding: '1.4375rem 0'
      }
    }
  }
});

export default Theme;
