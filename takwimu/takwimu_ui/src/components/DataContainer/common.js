// eslint-disable-next-line import/prefer-default-export
export const getShareHandler = (id, title, description) => () => {
  const url = new URL(window.location);
  url.searchParams.set('indicator', id);
  url.searchParams.set('title', title);
  url.searchParams.set('description', description);
  window.open(`https://twitter.com/intent/tweet?url=${encodeURI(url.href)}`);
};
