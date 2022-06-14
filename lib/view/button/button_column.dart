import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/theta/theta_bloc.dart';

class ButtonColumn extends StatelessWidget {
  const ButtonColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  context.read<ThetaBloc>().add(GetLastUrlEvent());
                },
                child: const Text("Get Last Url")),
            // TextButton(
            //     onPressed: () {
            //       context
            //           .read<ThetaBloc>()
            //           .add(GetListImagesEvent());
            //     },
            //     child: const Text("Get List Images")),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  context.read<ThetaBloc>().add(ShowImageEvent());
                },
                child: const Text("Show Image")),
            TextButton(
                onPressed: () {
                  context.read<ThetaBloc>().add(ShowListImagesEvent());
                },
                child: const Text("Show List Images")),
          ],
        ),
      ],
    );
  }
}
