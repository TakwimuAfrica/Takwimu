// eslint-disable-next-line import/prefer-default-export
export const shareIndicator = id => {
  const url = new URL(window.location);
  url.searchParams.set('indicator', id);
  window.open(`https://twitter.com/intent/tweet?url=${url.href}`);
};

export const uploadImage = (id, data) =>
  fetch({
    url: '/api/twitter_view',
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      id,
      image: data
    })
  }).then(res => {
    if (res.status === 200) {
      return true;
    }

    return false;
  });
