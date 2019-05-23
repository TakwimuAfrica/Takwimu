// eslint-disable-next-line import/prefer-default-export
import { getCookie } from '../../common';

export const shareIndicator = id => {
  const url = new URL(window.location);
  url.searchParams.set('indicator', id);
  window.open(`https://twitter.com/intent/tweet?url=${url.href}`);
};

export const uploadImage = (id, data) =>
  fetch('/api/twitter_view/', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRFToken': getCookie('csrftoken')
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
