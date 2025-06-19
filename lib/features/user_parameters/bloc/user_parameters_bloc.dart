import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_parameters_event.dart';
part 'user_parameters_state.dart';

class UserParametersBloc extends Bloc<UserParametersEvent, UserParametersState> {
  UserParametersBloc() : super(UserParametersInitial()) {
    on<UserParametersEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
