import 'package:project/core/resources/export_file.dart';

class CashedItem extends Equatable {
  final dynamic data;
  final int cashTime = DateTime.now().microsecondsSinceEpoch;
  CashedItem(this.data);

  @override
  List<Object?> get props => [data];
}
