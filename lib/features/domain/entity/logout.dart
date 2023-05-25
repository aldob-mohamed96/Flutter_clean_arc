import 'package:project/core/resources/export_file.dart';

class Logout extends Equatable{
  final bool isLoggout;
  const Logout(this.isLoggout);
  
  @override

  List<Object?> get props => [isLoggout];
}