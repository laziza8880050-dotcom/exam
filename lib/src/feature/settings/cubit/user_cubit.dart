import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/src/feature/settings/cubit/user_state.dart';
import 'package:fitness/src/feature/settings/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState()) {
    getuser();
  }

  Future<void> getuser() async {
    print('get lesson ishladi');
    emit(UserState(status: UserStatus.loading));
    try {
      final result = await FirebaseFirestore.instance
          .collection('user_info')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      List<UserModel> temp = [];
    print('lesson lar keldi ${temp.length}');
      emit(UserState(status: UserStatus.succes, user: temp));
      print('state legnth of lesson  ${state.user.length}');
    } on FirebaseException catch (e) {
      emit(
        UserState(
          status: UserStatus.error, 
          errorText: e.message ?? ' Xatoli'),
      );
    } catch (error) {
      emit(UserState(status: UserStatus.error, errorText: error.toString()));
    }
  }
}
