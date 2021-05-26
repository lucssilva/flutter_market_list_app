import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_list_crud_app/controllers/camera/camera.bloc.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final bloc = BlocProvider.of<CameraBloc>(context);
    if (!bloc.isInitialized) return;
    if (state == AppLifecycleState.inactive)
      bloc.add(CameraStopped());
    else if (state == AppLifecycleState.resumed) bloc.add(CameraInitialized());
  }

  @override
  build(_) => BlocConsumer<CameraBloc, CameraState>(
      listener: (_, state) {
        if (state is CameraCaptureSuccess)
          Navigator.of(_).pop(state.path);
        else if (state is CameraCaptureFailure)
          ScaffoldMessenger.of(_).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
      },
      builder: (_, state) => Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(title: Text("Camera"), centerTitle: true),
            body: state is CameraReady
                ? Container(
                    child: CameraPreview(
                    BlocProvider.of<CameraBloc>(_).controller,
                  ))
                : state is CameraFailure
                    ? Container(
                        color: Colors.white,
                        width: double.infinity,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error),
                              Container(child: Text('Camera Error'))
                            ]))
                    : Container(),
            floatingActionButton: state is CameraReady
                ? FloatingActionButton(
                    child: Icon(Icons.camera_alt),
                    onPressed: () =>
                        BlocProvider.of<CameraBloc>(_).add(CameraCaptured()))
                : Container(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ));
}
