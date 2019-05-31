// eslint-disable-next-line import/prefer-default-export
export const getCookie = name => {
  let cookieValue = null;
  if (document.cookie && document.cookie !== '') {
    const cookies = document.cookie.split(';').map(cookie => cookie.trim());
    const found = cookies.find(
      cookie => cookie.substring(0, name.length + 1) === `${name}=`
    );
    if (found) {
      cookieValue = decodeURIComponent(found.substring(name.length + 1));
    }
  }
  return cookieValue;
};
