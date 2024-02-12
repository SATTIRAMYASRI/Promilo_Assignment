import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meet_up_state.dart';

class MeetUpCubit extends Cubit<MeetUpState> {
  MeetUpCubit() : super(MeetUpInitial());

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    emit(MeetUpTabChanged());
  }
}
