import 'package:e_commerce_app/core/repo/product_repo/product_repo.dart';
import 'package:e_commerce_app/core/services/database_services.dart';
import 'package:e_commerce_app/core/services/firebase_auth_services.dart';
import 'package:e_commerce_app/core/services/firestore_services.dart';
import 'package:e_commerce_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

import '../repo/product_repo/product_repo_impl.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(databaseServices: getIt<DatabaseServices>()));
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      databaseServices: getIt<DatabaseServices>()));
}
