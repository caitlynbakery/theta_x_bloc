import 'package:flutter/material.dart';
import 'package:theta_bloc_app/blocs/theta/theta_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThetaBloc(),
      child: MaterialApp(
        home: SafeArea(
          child: Scaffold(body: BlocBuilder<ThetaBloc, ThetaState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              context.read<ThetaBloc>().add(GetInfoEvent());
                            },
                            child: const Text("Info")),
                        TextButton(
                            onPressed: () {
                              context.read<ThetaBloc>().add(GetStateEvent());
                            },
                            child: const Text("State")),
                        TextButton(
                            onPressed: () {
                              context.read<ThetaBloc>().add(PictureEvent());
                            },
                            child: const Text("Take Picture")),
                        TextButton(
                            onPressed: () {
                              context.read<ThetaBloc>().add(ListFilesEvent());
                            },
                            child: const Text("List Files")),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            context.read<ThetaBloc>().add(GetLastUrlEvent());
                          },
                          child: const Text("Get Last Url")),
                      TextButton(
                          onPressed: () {
                            context.read<ThetaBloc>().add(ShowImageEvent());
                          },
                          child: const Text("Show Image")),
                      TextButton(
                          onPressed: () {
                            context.read<ThetaBloc>().add(GetListImagesEvent());
                          },
                          child: const Text("Get List Images")),
                    ],
                  ),
                  Expanded(
                      flex: 4,
                      child: state.showImage
                          ? Image.network(state.lastImageUrl)
                          : SelectableText(state.message)),
                ],
              );
            },
          )),
        ),
      ),
    );
  }
}
