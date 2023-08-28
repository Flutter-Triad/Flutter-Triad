import 'package:flutter_triad/core/error_handler/error_handler.dart';
import 'package:flutter_triad/core/internet_checker/interent_checker.dart';
import 'package:flutter_triad/core/resources/manager_strings.dart';
import 'package:flutter_triad/features/auth/data/data_source/remote_data_source.dart';
import 'package:flutter_triad/features/auth/data/mapper/register_mapper.dart';
import 'package:flutter_triad/features/auth/data/request/register_request.dart';
import 'package:flutter_triad/features/auth/domain/models/register_model.dart';
import 'package:flutter_triad/features/auth/domain/repository/register_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterRepoImplement implements RegisterRepository{
  RemoteRegisterDataSource _remoteRegisterDataSource;
  NetworkInfo _networkInfo ;
  RegisterRepoImplement(this._networkInfo,this._remoteRegisterDataSource);
  @override
  Future<Either<Failure, Register>> register(RegisterRequest registerRequest) async{
      if(await _networkInfo.isConnected){
        /// Its connected
        try{
          final response = await _remoteRegisterDataSource.register(registerRequest);
          return Right(response.toDomain());

        }catch(e){
          try{
            return Left(
                Failure(ResponseCode.INTERNAL_SERVER_ERROR, ManagerStrings.INTERNAL_SERVER_ERROR)
            );
          }catch(e){
            return Left(Failure(ResponseCode.UNKNOWN, ManagerStrings.UNKNOWN));
          }
        }
      }else{
        return Left(Failure(ResponseCode.NO_INTERNET_CONNECTION, ManagerStrings.NO_INTERNT_CONNECTION));
      }

  }  
}