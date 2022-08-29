import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/dataSource/local/local_storage.dart';
import '../../data/models/mascota.dart';

part 'save_pet_event.dart';
part 'save_pet_state.dart';

class SavePetBloc extends Bloc<SavePetEvent, SavePetState> {
  final storage = LocalStorage();

  SavePetBloc() : super(const SavePetInitial()) {
    on<SavePet>(_onSavePet);
  }

  _onSavePet(SavePet event, Emitter<SavePetState> emit) async {
    emit(const SavePetInProgress());
    await storage.savePet(mascota: event.mascota);
    emit(const SavePetSuccess());
    
  }
}
