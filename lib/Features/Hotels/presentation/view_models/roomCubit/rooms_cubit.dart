import 'package:bloc/bloc.dart';
import 'package:tourismapp/Features/Hotels/data/repositories/room_repository.dart';
import 'package:tourismapp/Features/Hotels/presentation/view_models/roomCubit/rooms_state.dart';

class RoomsCubit extends Cubit<RoomsState> {
  final RoomRepository roomRepository;
  RoomsCubit( this.roomRepository) : super(RoomsInitial());

  Future<void> getRooms(int idHotel) async{
    emit(RoomsLoading());
    try{
      final rooms=await roomRepository.getRooms(idHotel);
      emit(RoomsSuccess(rooms));
    }catch(e){
      emit(RoomsError(e.toString()));
    }
  }
}
