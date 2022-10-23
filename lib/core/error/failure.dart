import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const <dynamic>[];
  const Failure({required properties});

  @override
  List<Object?> get props => [properties];
}
