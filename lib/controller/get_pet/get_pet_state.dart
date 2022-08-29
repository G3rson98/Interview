part of 'get_pet_bloc.dart';

@immutable
abstract class GetPetState {
  const GetPetState();
}

class GetPetInitial extends GetPetState {
  const GetPetInitial();
}

class GetPetInProgress extends GetPetState {
  const GetPetInProgress();
}

class GetPetSuccess extends GetPetState {
  final List<Mascota> mascotas;
  const GetPetSuccess({required this.mascotas});
}

class GetPetFailure extends GetPetState {
  const GetPetFailure();
}
