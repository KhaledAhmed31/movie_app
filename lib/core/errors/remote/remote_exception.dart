import '../app_exception.dart';

class RemoteException extends AppException {
  RemoteException({required String message}) : super( message);
}
