Map<String, String> countryCodes = {
  'United Arab Emirates': 'ae',
  'Saudi Arabia': 'sa',
  'Taiwan': 'tw',
  'Malaysia': 'my',
  'Singapore': 'sg',
  'Macau': 'mo',
  'Hong Kong': 'hk',
  'Qatar': 'qa',
  'Kuwait': 'kw',
  'Canada': 'ca',
};

String getCountryCodeFromName(String countryName) {
  String? code = countryCodes[countryName]?.toLowerCase();
  return code != null ? code.toLowerCase() : 'unknown';
}
