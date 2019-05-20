// eslint-disable-next-line import/prefer-default-export
export const getShareHandler = id => () => {
  const url = new URL(window.location);
  url.searchParams.set('indicator', id);
  window.open(`https://twitter.com/intent/tweet?url=${url.href}`);
};
