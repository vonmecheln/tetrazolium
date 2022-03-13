import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  final String email;
  final String name;
  final String phoneNumber;

  const LoggedUser({
    required this.email,
    required this.name,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [email, name, phoneNumber];
}
