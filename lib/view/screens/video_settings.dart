import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theta_bloc_app/blocs/theta/theta_bloc.dart';

class VideoSettings extends StatelessWidget {
  const VideoSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThetaBloc, ThetaState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Shooting \n Settings',
                    style: TextStyle(
                        fontFamily: 'BaksoSapi',
                        fontSize: 50,
                        color: Color.fromARGB(255, 86, 86, 86)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        context.read<ThetaBloc>().add(SetVideoModeEvent());
                      },
                      icon: Icon(
                        Icons.videocam,
                        size: 40,
                        color: Color.fromARGB(255, 172, 120, 227),
                      )),
                  IconButton(
                      onPressed: () {
                        context.read<ThetaBloc>().add(SetImageModeEvent());
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: Color.fromARGB(255, 252, 143, 179),
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        context.read<ThetaBloc>().add(SetVideo2FPSEvent());
                      },
                      child: Text(
                        "8K 2fps",
                        style: TextStyle(
                            color: Color.fromARGB(255, 172, 120, 227)),
                      )),
                  TextButton(
                      onPressed: () {
                        context.read<ThetaBloc>().add(SetVideo5FPSEvent());
                      },
                      child: Text(
                        "8K 5fps",
                        style: TextStyle(
                            color: Color.fromARGB(255, 172, 120, 227)),
                      )),
                  TextButton(
                      onPressed: () {
                        context.read<ThetaBloc>().add(SetImage5KEvent());
                      },
                      child: Text(
                        "5.5K",
                        style: TextStyle(
                            color: Color.fromARGB(255, 252, 143, 179)),
                      )),
                  TextButton(
                      onPressed: () {
                        context.read<ThetaBloc>().add(SetImage11KEvent());
                      },
                      child: Text(
                        "11K",
                        style: TextStyle(
                            color: Color.fromARGB(255, 252, 143, 179)),
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
