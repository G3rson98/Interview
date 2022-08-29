import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/save_pet/save_pet_bloc.dart';
import '../../data/models/mascota.dart';

class SavePetForm {
  late final List<TextEditingController> _controllers;
  XFile? _image = null;
  final SavePetBloc savePetBloc;

  SavePetForm({required this.savePetBloc}) {
    _controllers = List.generate(3, (index) => TextEditingController());
  }

  getContr(int index) => _controllers[index];
  getImage() => _image;

  submit() {
    final mascota = Mascota(
      name: _controllers[0].text,
      lat: double.parse(_controllers[1].text),
      lon: double.parse(_controllers[2].text),
      image: _image,
    );
    savePetBloc.add(SavePet(mascota: mascota));
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    _image = await _picker.pickImage(source: ImageSource.gallery);
  }
}
