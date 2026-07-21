
import 'package:tourismapp/Features/Hotels/data/models/room_model.dart';

abstract class RoomsState {}

final class RoomsInitial extends RoomsState {}
final class RoomsLoading extends RoomsState{}
final class RoomsSuccess extends RoomsState{
  final List<RoomModel> rooms;
  RoomsSuccess( this.rooms);
}
final class RoomsError extends RoomsState{
  final String message;
  RoomsError(this.message);

}
