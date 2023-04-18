class Task {
  Task({required this.description, bool isDone = false}) : _isDone = isDone;
  final String description;
  bool _isDone;

  //Getters:
  bool get isDone => _isDone;

  //Methods:
  void toggleIsDone() {
    _isDone = !_isDone;
  }
}
