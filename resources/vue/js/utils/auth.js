import Cookies from 'js-cookie';

const TokenKey = 'isLogged';

export function isLogged() {
//  return Cookies.get(TokenKey) === '1';
  return true;
}

export function setLogged(isLogged) {
  return Cookies.set(TokenKey, isLogged);
}

export function removeToken() {
  return Cookies.remove(TokenKey);
}
