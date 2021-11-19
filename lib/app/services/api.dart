import 'package:covid_19_tracker_with_api/app/services/api_keys.dart';


enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

class API {
  API({required this.apiKey});
  final String apiKey;

  factory API.sandbox() {
    return API(apiKey: APIKeys.ncovSandboxKey);
  }

  static final String host = 'ncov2019-admin.firebaseapp.com';

  Uri tokenUri() {
    return Uri(
      scheme: 'https',
      host: host,
      path: 'token',
    );
  }

  Uri endpointUri(Endpoint endpoint) {
    return Uri(
      scheme: 'https',
      host: host,
      path: _paths[endpoint],
    );
  }

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };
}
