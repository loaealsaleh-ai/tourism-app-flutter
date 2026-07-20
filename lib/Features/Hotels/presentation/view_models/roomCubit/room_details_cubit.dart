import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tourismapp/Features/Hotels/data/models/room_model.dart';
import 'package:tourismapp/Features/Hotels/data/repositories/room_repository.dart';

part 'room_details_state.dart';

class RoomDetailsCubit extends Cubit<RoomDetailsState> {
  final RoomRepository roomRepository;
  RoomDetailsCubit(this.roomRepository) : super(RoomDetailsInitial());


  Future<void> getRoomById(int idRoom)async{
    emit(RoomDetailsLoading());
    try{
      final room=await roomRepository.getRoomById(idRoom);
      emit(RoomDetailsSuccess(room));
    }catch(e){
      emit(RoomDetailsError(e.toString()));
    }
  }
}
