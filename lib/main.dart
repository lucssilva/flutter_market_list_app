import 'package:flutter/material.dart';

import 'view/pages/index.page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MarketListApp());
}

class MarketListApp extends StatelessWidget {
  @override
  build(_) => MaterialApp(
        home: IndexPage(),
        title: 'Market List App',
        theme: ThemeData(primarySwatch: Colors.indigo),
      );
}
