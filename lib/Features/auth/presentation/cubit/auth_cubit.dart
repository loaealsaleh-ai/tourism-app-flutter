import 'package:tourismapp/core/storage/token_storage_service.dart';
import 'package:tourismapp/Features/auth/data/repositories/auth_repository.dart';
import 'package:tourismapp/Features/auth/presentation/view_models/auth_view_model.dart';

class AuthCubit extends AuthViewModel {
  AuthCubit(AuthRepository repository)
      : super(
          repository: repository,
          tokenStorageService: TokenStorageService(),
        );
}
