part of 'missed_cubit.dart';

@immutable
sealed class MissedState {}

final class MissedStateLoading extends MissedState {}

final class MissedStateLoaded extends MissedState {}

final class MissedStateEmpty extends MissedState {}
