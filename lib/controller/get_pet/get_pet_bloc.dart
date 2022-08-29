import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/dataSource/local/local_storage.dart';
import '../../data/models/mascota.dart';

part 'get_pet_event.dart';
part 'get_pet_state.dart';

class GetPetBloc extends Bloc<GetPetEvent, GetPetState> {
  final storage = LocalStorage();
  GetPetBloc() : super(const GetPetInitial()) {
    on<GetPets>(_onGetPets);
  }

  _onGetPets(GetPets event, Emitter<GetPetState> emit) async {
    emit(const GetPetInProgress());
    // await Future.delayed(const Duration(seconds: 2));
    final mascotas = await storage.getPet();
    emit(GetPetSuccess(mascotas: mascotas));
  }
}
