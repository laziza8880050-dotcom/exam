import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/src/core/service/google_service.dart';
import 'package:fitness/src/feature/auth/cubit/auth_state.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());
  Future<void> singUp({required String email, required String password}) async {
    print("Email $email password $password");
    emit(AuthState(status: AuthStatus.loading));
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        emit(AuthState(status: AuthStatus.loaded));
      } else {
        emit(AuthState(status: AuthStatus.error));
      }
    } on FirebaseAuthException catch (e) {
      print("Error mess on firebase auth $e");
      emit(AuthState(status: AuthStatus.error));
    } catch (e) {
      print('error on auth $e');
      emit(AuthState(status: AuthStatus.error));
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    emit(AuthState(status: AuthStatus.loading));
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (result.user != null) {
        emit(AuthState(status: AuthStatus.loading));
      } else {
        emit(AuthState(status: AuthStatus.error));
      }
    } catch (e) {
      emit(AuthState(status: AuthStatus.error));
    }
  }

  Future<void> singinwithgoogle() async {

    emit(AuthState(status: AuthStatus.loading));
    try {
      final user = await GoogleAuthService.signInWithGoogle(false);
      if (user != null) {
        emit(AuthState(status: AuthStatus.loaded));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthState(status: AuthStatus.error));
    }
  }
  Future<void> forgetpassword ({required String email}) async{
    emit(AuthState(status: AuthStatus.loaded));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(AuthState(status: AuthStatus.loaded));

    } on FirebaseException catch(e){
      emit(AuthState(status: AuthStatus.error,));
    }
    catch (error) {
       emit(AuthState(status: AuthStatus.error,));

    }
  }
  }
