part of 'get_pet_bloc.dart';

@immutable
abstract class GetPetEvent {
  const GetPetEvent();
}

class GetPets extends GetPetEvent {
  const GetPets();
}
