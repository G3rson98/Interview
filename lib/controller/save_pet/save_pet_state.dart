part of 'save_pet_bloc.dart';

@immutable
abstract class SavePetState {
  const SavePetState();
}

class SavePetInitial extends SavePetState {
  const SavePetInitial();
}

class SavePetInProgress extends SavePetState {
  const SavePetInProgress();
}

class SavePetSuccess extends SavePetState {
  const SavePetSuccess();
}

class SavePetFailure extends SavePetState {
  const SavePetFailure();
}
