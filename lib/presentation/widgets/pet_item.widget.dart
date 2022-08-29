import 'dart:convert';

import 'package:flutter/material.dart';

class PetItem extends StatelessWidget {
  final String name;
  final String? image;
  const PetItem({Key? key, required this.name, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image != null
              ? SizedBox(
                  height: 44,
                  child: Image.memory(
                    base64.decode(image!),
                  ))
              : SizedBox(
                  height: 44,
                  width: 44,
                  child: Container(
                    color: Colors.amber,
                  ),
                ),
          Text(name),
          IconButton(
            onPressed: () {
            },
            iconSize: 44,
            icon: const Icon(Icons.gps_fixed),
          ),
        ],
      ),
    );
  }
}
