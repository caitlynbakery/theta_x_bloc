import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/theta/theta_bloc.dart';

class ResponseWindow extends StatelessWidget {
  const ResponseWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThetaBloc, ThetaState>(
      builder: (context, state) {
        if (context.watch<ThetaBloc>().state.showImage) {
          print('show image');
          return Image.network(state.lastImageUrl);
        } else if (context.watch<ThetaBloc>().state.showList) {
          print('show list of images');
          return ListView.builder(
              itemCount: state.urlList.length,
              itemBuilder: ((context, index) {
                return Image.network('${state.urlList[index]}?type=thumb');
              }));
        } else if (context.watch<ThetaBloc>().state.showMessage) {
          return SelectableText(state.message);
        } else {
          return Text('camera response');
        }
      },
    );
  }
}
