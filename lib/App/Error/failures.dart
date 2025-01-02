abstract class Failures {
  final String msg;
  final bool local;

  Failures({required this.msg, required this.local});
}

class ServerFailure extends Failures {
  ServerFailure({
    required super.msg ,
    super.local = false
  });
}

class LocalFailure extends Failures {
  LocalFailure({
    required super.msg ,
    super.local = false
  });
}