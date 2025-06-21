import 'package:flutter/material.dart';

class DescriptionCategoryWorkout extends StatelessWidget {
  const DescriptionCategoryWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    final themeDark = Theme.of(context);
    return Scaffold(
      backgroundColor: themeDark.scaffoldBackgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: 350,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/images/challenges/exercise/2.png',
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
