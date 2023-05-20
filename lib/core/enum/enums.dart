// ignore_for_file: public_member_api_docs, sort_constructors_first

//import 'package:project/core/resources/export_file.dart';

enum AppAuthenticationLevel{
  darft,
  unAuthenticated,
  authenticated
}
enum FlowStateApp{
  darft,
  loading,
  normal,
  error,
  successInserting,
  successDeleting,
  successUpdate,
  hint,
  missingData,
  unAuthenticated,
  updateApp,
  noConnection,
  weakConnection,
  connectionRestored

}