part of 'save_pet_bloc.dart';

@immutable
abstract class SavePetEvent {
  const SavePetEvent();
}

class SavePet extends SavePetEvent {
  final Mascota mascota;
  const SavePet({required this.mascota});
}
