import 'package:equatable/equatable.dart';
import 'package:task_todo/App/Error/failures.dart';

abstract class BaseUseCase<T , Parameters> {
  Future<({Failures? failures, T value})> call(Parameters parameters);
}


class NoParameters extends Equatable {

  const NoParameters();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}