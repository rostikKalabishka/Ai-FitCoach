import 'package:ai_fit_coach/common/api/model/user_data.dart';
import 'package:ai_fit_coach/common/api/model/user_motivation.dart'
    hide FitnessLevel, Goal;
import 'package:ai_fit_coach/repositories/user_repository/user.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_parameters_event.dart';
part 'user_parameters_state.dart';

class UserParametersBloc
    extends Bloc<UserParametersEvent, UserParametersState> {
  UserData _userData = UserData.emptyUserData;
  final AbstractUserRepository _userRepository;

  UserParametersBloc({required AbstractUserRepository userRepository})
      : _userRepository = userRepository,
        super(UserParametersInitial()) {
    on<GoalSelected>(_onGoalSelected);
    on<FitnessLevelChanged>(_onFitnessLevelChanged);
    on<BodyParametersChanged>(_onBodyParametersChanged);
    on<MotivationChanged>(_onMotivationChanged);
    on<DietSelected>(_onDietSelected);
    on<ActivitiesSelected>(_onActivitiesSelected);
    on<BadHabitsSelected>(_onBadHabitsSelected);
    on<TrainingDaysSelected>(_onTrainingDaysSelected);
    on<TermsChanged>(_onTermsChanged);
    on<SubmitParameters>(_onSubmitParameters);
  }

  UserData get userData => _userData;

  void _onGoalSelected(GoalSelected event, Emitter<UserParametersState> emit) {
    _userData = _userData.copyWith(goal: event.goal);
    emit(const UserParametersProcess());
  }

  void _onFitnessLevelChanged(
      FitnessLevelChanged event, Emitter<UserParametersState> emit) {
    _userData = _userData.copyWith(level: event.level);
    emit(const UserParametersProcess());
  }

  void _onBodyParametersChanged(
      BodyParametersChanged event, Emitter<UserParametersState> emit) {
    _userData = _userData.copyWith(
      weight: event.weight,
      height: event.height,
      age: event.age,
    );
    emit(const UserParametersProcess());
  }

  void _onMotivationChanged(
      MotivationChanged event, Emitter<UserParametersState> emit) {
    _userData = _userData.copyWith(motivation: event.motivation);
    emit(const UserParametersProcess());
  }

  void _onDietSelected(DietSelected event, Emitter<UserParametersState> emit) {
    _userData = _userData.copyWith(diet: event.diet);
    emit(const UserParametersProcess());
  }

  void _onActivitiesSelected(
      ActivitiesSelected event, Emitter<UserParametersState> emit) {
    _userData = _userData.copyWith(activities: event.activities);
    emit(const UserParametersProcess());
  }

  void _onBadHabitsSelected(
      BadHabitsSelected event, Emitter<UserParametersState> emit) {
    _userData = _userData.copyWith(badHabits: event.badHabits);
    emit(const UserParametersProcess());
  }

  void _onTrainingDaysSelected(
      TrainingDaysSelected event, Emitter<UserParametersState> emit) {
    _userData = _userData.copyWith(trainingDays: event.trainingDays);
    emit(const UserParametersProcess());
  }

  void _onTermsChanged(TermsChanged event, Emitter<UserParametersState> emit) {
    _userData = _userData.copyWith(termsAccepted: event.accepted);
    emit(const UserParametersProcess());
  }

  Future<void> _onSubmitParameters(
      SubmitParameters event, Emitter<UserParametersState> emit) async {
    emit(const UserParametersProcess());
    if (_userData.isComplete) {
      try {
        final currentUser = await _userRepository.getMyUser(event.userId);
        final updateUser = currentUser.copyWith(userData: _userData);
        print(updateUser);
        await _userRepository.setUserData(updateUser);
        emit(const UserParametersSuccess());
      } catch (e) {
        emit(UserParametersFailure(error: 'Error sending data: $e'));
      }
    } else {
      emit(const UserParametersFailure(
          error: 'Please fill in all required fields'));
    }
  }
}
