import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;

  Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  final String message;
  ServerFailure({this.message = 'Server Failure'}) : super(message: message);
  
  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  final String message;
  CacheFailure({this.message = 'Cache Failure'}) : super(message: message);
}