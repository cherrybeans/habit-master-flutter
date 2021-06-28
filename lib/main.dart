import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:universal_platform/universal_platform.dart';

import 'app.dart';

String get host {
// https://github.com/flutter/flutter/issues/36126#issuecomment-596215587
  if (UniversalPlatform.isAndroid) {
    return '10.0.2.2';
  } else {
    return '127.0.0.1';
  }
}

final graphqlEndpoint = 'http://$host:8000/graphql';

void main() async {
  // We're using HiveStore for persistence,
  // so we need to initialize Hive.
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(graphqlEndpoint);

  /*final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    );

    final Link link = authLink.concat(httpLink);
    */

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(HabitsApp(client: client));
}
