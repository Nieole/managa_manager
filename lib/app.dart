import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'pages/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink('https://komiic.com/api/query');

    // 如果需要认证
    // final AuthLink authLink = AuthLink(
    //   getToken: () async => 'Bearer YOUR_ACCESS_TOKEN', // 替换为你的 Token
    // );
    // final Link link = authLink.concat(httpLink);

    final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(store: InMemoryStore()),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: '漫画管理',
        builder: EasyLoading.init(),
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        home: const HomePage(),
      ),
    );
  }
}


