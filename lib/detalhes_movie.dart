import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalhesMovie extends StatelessWidget {
  const DetalhesMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: Get.width,
            color: Theme.of(context).primaryColor,
            child: FlutterLogo(),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 5,
                  left: 10,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                  bottom: 5,
                  child: Text(
                    "Text",
                    style: TextStyle(fontSize: 22),
                  )),
              SizedBox(
                height: 20,
              )
            ],
          )
        ],
      ),
    );
  }
}
