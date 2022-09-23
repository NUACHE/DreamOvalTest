class Endpoints {
  static get baseUrl => 'https://billbox-billing-api.p.rapidapi.com/billing';

  static get collections => Uri.parse(baseUrl + '/collections');
  static get payment => Uri.parse(baseUrl + '/pay');
}
