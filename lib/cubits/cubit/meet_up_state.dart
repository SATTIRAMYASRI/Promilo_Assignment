part of 'meet_up_cubit.dart';

@immutable
sealed class MeetUpState {}

final class MeetUpInitial extends MeetUpState {}
final class MeetUpTabChanged extends MeetUpState {}
