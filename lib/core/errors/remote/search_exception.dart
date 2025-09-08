import 'package:movie_app/core/errors/app_exception.dart';

class SearchException extends AppException{
const  SearchException({required String message}) : super(message);
}