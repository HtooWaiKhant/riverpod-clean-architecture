abstract class Failure {
  final String message;

  Failure({required this.message});
}

class SomeSpecificFailure extends Failure {
  SomeSpecificFailure({required String message}) : super(message: message);
}