import 'package:movie_app/core/errors/app_exception.dart';

class RemoteException extends AppException {
  RemoteException({required String message}) : super( message);
}
