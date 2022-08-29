import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/get_pet/get_pet_bloc.dart';
import '../../controller/save_pet/save_pet_bloc.dart';
import '../utils/form_util.util.dart';

class FormPet extends StatefulWidget {
  const FormPet({Key? key}) : super(key: key);

  @override
  State<FormPet> createState() => _FormPetState();
}

class _FormPetState extends State<FormPet> {
  late final SavePetForm formUtil;
  late final SavePetBloc savePetBloc;

  @override
  void initState() {
    savePetBloc = SavePetBloc();
    formUtil = SavePetForm(savePetBloc: savePetBloc);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => savePetBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar animal'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocConsumer<SavePetBloc, SavePetState>(
            listener: (context, state) {
              if (state is SavePetSuccess) {
                context.read<GetPetBloc>().add(const GetPets());
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              return Form(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      formUtil.getImage() != null
                          ? SizedBox(
                              height: 150,
                              child: Image.file(
                                File(formUtil.getImage().path),
                                fit: BoxFit.cover,
                              ),
                            )
                          : InkWell(
                              onTap: () async {
                                //TODO: seleccionar imagen
                                await formUtil.pickImage();
                                setState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black, //color of border
                                    width: 2, //width of border
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Seleccionar imágen'),
                                      const Icon(Icons.image),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                      TextFormField(
                        controller: formUtil.getContr(0),
                        decoration: const InputDecoration(
                          label: Text('Tipo o nombre del animal'),
                        ),
                      ),
                      TextFormField(
                        controller: formUtil.getContr(1),
                        decoration: const InputDecoration(
                          label: Text('Latitud'),
                        ),
                      ),
                      TextFormField(
                        controller: formUtil.getContr(2),
                        decoration: const InputDecoration(
                          label: Text('Longitud'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => formUtil.submit(),
                        child: state is SavePetInProgress
                            ? const CircularProgressIndicator()
                            : const Text('Guardar'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
