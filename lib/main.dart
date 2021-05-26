import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_list_crud_app/services/camera.helper.dart';

import 'controllers/camera/camera.bloc.dart';
import 'view/pages/addedit.page.dart';
import 'view/pages/index.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MarketListApp(camera: firstCamera));
}

class MarketListApp extends StatelessWidget {
  const MarketListApp({@required this.camera});
  final CameraDescription camera;

  @override
  build(_) => MaterialApp(
        title: 'Market List App',
        routes: {
          IndexPage.ROUTE: (_) => IndexPage(),
          AddOrEditPage.ROUTE: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider<CameraBloc>(
                    create: (_) => CameraBloc(cameraHelper: CameraHelper()),
                  ),
                ],
                child: AddOrEditPage(),
              ),
        },
        theme: ThemeData.dark().copyWith(primaryColor: Colors.tealAccent[700]),
      );
}
