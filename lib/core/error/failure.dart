import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const <dynamic>[];
  const Failure({required properties});

  @override
  List<Object?> get props => [properties];
}

//General Failures//

class ServerFailure extends Failure {
  const ServerFailure({required List properties})
      : super(properties: properties);
}

class CartFailure extends Failure {
  const CartFailure({required List properties}) : super(properties: properties);
}

class CacheFailure extends Failure {
  const CacheFailure({required List properties})
      : super(properties: properties);
}

class NoInternetFailure extends Failure {
  const NoInternetFailure({required List properties})
      : super(properties: properties);
}
