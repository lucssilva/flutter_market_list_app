import 'package:flutter/material.dart';

import 'utils/consts.dart';
import 'view/pages/addedit.page.dart';
import 'view/pages/index.page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MarketListApp());
}

class MarketListApp extends StatelessWidget {
  @override
  build(_) => MaterialApp(
        title: 'Market List App',
        routes: {
          Routes.INDEX: (_) => IndexPage(),
          Routes.ADD: (_) => AddOrEditPage(),
        },
        theme: ThemeData.dark().copyWith(primaryColor: Colors.tealAccent[700]),
      );
}
