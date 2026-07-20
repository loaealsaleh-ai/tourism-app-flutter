part of 'room_details_cubit.dart';

abstract class RoomDetailsState {}

final class RoomDetailsInitial extends RoomDetailsState {}
final class RoomDetailsLoading extends RoomDetailsState {}
final class RoomDetailsSuccess extends RoomDetailsState {
  final RoomModel roomModel;

  RoomDetailsSuccess(this.roomModel);
}
final class RoomDetailsError extends RoomDetailsState {
  final String message;

  RoomDetailsError(this.message);
}
