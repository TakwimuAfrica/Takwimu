const countrify = (title, country, countries, conj = '&rsquo;s ') => {
  const foundCountry = countries.find(c => c.slug === country.slug);
  if (
    foundCountry &&
    !title.toLowerCase().startsWith(foundCountry.short_name.toLowerCase())
  ) {
    return `${foundCountry.short_name}${conj}${title}`;
  }
  return title;
};

export default countrify;
