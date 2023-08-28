import '../../../../core/error_handler/error_handler.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../data/request/login_request.dart';
import '../models/login_model.dart';
import '../repository/login_repository.dart';
import 'package:dartz/dartz.dart';


class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Login>{
  final  LoginRepository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Login>> execute(LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(email : input.email, password: input.password));
  }
}


class LoginUseCaseInput{
  String email;
  String password;
  LoginUseCaseInput({required this.email,required this.password});
}