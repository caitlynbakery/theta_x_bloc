import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'theta_event.dart';
part 'theta_state.dart';

class ThetaBloc extends Bloc<ThetaEvent, ThetaState> {
  ThetaBloc() : super(ThetaState.initial()) {
    on<GetInfoEvent>((event, emit) async {
      var url = Uri.parse('http://192.168.1.1/osc/info');
      var response = await http.get(url);
      emit(ThetaState(message: response.body));
    });
    on<GetStateEvent>((event, emit) async {
      var url = Uri.parse('http://192.168.1.1/osc/state');
      var response = await http.post(url);
      emit(ThetaState(message: response.body));
    });
    on<PictureEvent>((event, emit) async {
      var url = Uri.parse('http://192.168.1.1/osc/commands/execute');
      var header = {'Content-Type': 'application/json;charset=utf-8'};
      var bodyMap = {'name': 'camera.takePicture'};
      var bodyJson = jsonEncode(bodyMap);
      var response = await http.post(url, headers: header, body: bodyJson);
      emit(ThetaState(message: response.body));
    });
  }
}
