import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/get_pet/get_pet_bloc.dart';
import '../widgets/pet_item.widget.dart';
import 'form_pet.page.dart';

class MainList extends StatefulWidget {
  const MainList({Key? key}) : super(key: key);

  @override
  State<MainList> createState() => _MainListState();
}

class _MainListState extends State<MainList> {
  late final GetPetBloc getPetsBloc;

  @override
  void initState() {
    getPetsBloc = GetPetBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => getPetsBloc),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Animales encontrados'),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: getPetsBloc,
                  child: const FormPet(),
                ),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        body: BlocBuilder<GetPetBloc, GetPetState>(
          bloc: getPetsBloc..add(const GetPets()),
          builder: (context, state) {
            if (state is GetPetSuccess) {
              return Column(
                children: state.mascotas
                    .map(
                      (e) => PetItem(
                        name: e.name,
                        image: e.encodedImage,
                      ),
                    )
                    .toList(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
