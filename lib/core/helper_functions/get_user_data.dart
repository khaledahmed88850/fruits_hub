import 'dart:convert';

import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entities/user_entity.dart';

UserEntity getUser ()
{
  var user = Prefs.getString(kUserData);

  return UserModel.fromJson(json.decode(user));
}