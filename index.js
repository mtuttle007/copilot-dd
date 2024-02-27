function splitURLandReturnComponents(url) {
  if (url === '') {
    return 'Empty url';
  }
  if (url.indexOf('://') === -1) {
    return 'Invalid url';
  }
  const protocol = url.split('://')[0];
  const domain = url.split('://')[1].split('/')[0];
  const path = url.split('://')[1].split('/').slice(1).join('/');
  return { protocol, domain, path };
}

