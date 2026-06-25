import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness/src/feature/settings/cubit/user_state.dart';
import 'package:fitness/src/feature/settings/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> getUser() async {
    emit(
      state.copyWith(
        status: ProfileStatus.loading,
      ),
    );

    try {
      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        emit(
          state.copyWith(
            status: ProfileStatus.error,
            errorText: 'User not found',
          ),
        );
        return;
      }

      final doc = await FirebaseFirestore.instance
          .collection('user_info')
          .doc(currentUser.uid)
          .get();

      if (!doc.exists || doc.data() == null) {
        emit(
          state.copyWith(
            status: ProfileStatus.error,
            errorText: 'Profile not found',
          ),
        );
        return;
      }
      print(FirebaseAuth.instance.currentUser!.uid);

      final user = UserModel.fromJson(doc.data()!);

      emit(
        state.copyWith(
          status: ProfileStatus.success,
          user: user,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProfileStatus.error,
          errorText: e.toString(),
        ),
      );
    }
  }
}