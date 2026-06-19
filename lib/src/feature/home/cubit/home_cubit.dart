import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness/src/feature/home/cubit/home_state.dart';
import 'package:fitness/src/feature/home/model/lesson_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState()) {
  getlesson();
  }

  Future<void> getlesson() async {
    print('get lesson ishladi');
    emit(HomeState(status: HomeStatus.loading));
    try {
      final result = await FirebaseFirestore.instance.collection('lesson').get();
      List<LessonModel> temp = [];
      for (int i = 0; i < result.docs.length; i++) {
        temp.add(LessonModel.fromJson(result.docs[i].data()));
      }
      print('lesson lar keldi ${temp.length}');
      emit(HomeState(status: HomeStatus.succes, lesson: temp));
      print('state legnth of lesson  ${state.lesson.length}');
    } on FirebaseException catch (e) {
      emit(
        HomeState(status: HomeStatus.error, errorText: e.message ?? ' Xatoli'),
      );
    } catch (error) {
      emit(HomeState(status: HomeStatus.error, errorText: error.toString()));
    }
  }
}


  

