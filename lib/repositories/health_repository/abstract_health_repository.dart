abstract interface class AbstractHealthRepository {
  Future<int> getSteps();
  Future<int> getStepsForDate(DateTime date);
}
