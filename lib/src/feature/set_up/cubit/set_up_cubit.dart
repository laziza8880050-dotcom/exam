import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/src/feature/set_up/cubit/set_up_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetUpCubit extends Cubit<SetUpState> {
  SetUpCubit() : super(SetUpState());

  void collectInfo({required String key, required dynamic value}) {
    Map<String, dynamic> userInfo = state.userInfo ?? {};

    userInfo.addAll({key: value});

    print('Qoshildi $userInfo');
    emit(state.copyWith(userInfo: userInfo));
  }

  Future<void> sendInfo() async {
    emit(state.copyWith(status: SetUpStatus.loading));
    try {
      await FirebaseFirestore.instance
          .collection('user_info')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set(state.userInfo!);
      emit(state.copyWith(status: SetUpStatus.success));
    } catch (e) {
      print('error send info $e ${FirebaseAuth.instance.currentUser?.uid}');
      emit(state.copyWith(status: SetUpStatus.error));
    }
  }
}
