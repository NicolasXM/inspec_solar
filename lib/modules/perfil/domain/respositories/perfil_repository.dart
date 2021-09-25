import 'package:dartz/dartz.dart';

import 'package:dartz/dartz.dart';
import 'package:inspec_solar/modules/perfil/domain/errors/error_createuser.dart';
import 'package:inspec_solar/modules/perfil/domain/models/entities/perfil_entity.dart';

abstract class PerfilRepository {
  Future<Either<CreateUserError, Perfil>> call(String perfil);

  
}
