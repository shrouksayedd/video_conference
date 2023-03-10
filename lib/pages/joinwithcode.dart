
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../video_call.dart';

class Joinwithcode extends StatelessWidget {
  const Joinwithcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController code_controller=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_sharp, size: 30,color: Colors.black,), onPressed: () { Get.back(); },),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(

            children: [


              SizedBox(height: 90),
              Image.network('https://user-images.githubusercontent.com/67534990/127776450-6c7a9470-d4e2-4780-ab10-143f5f86a26e.png'),
              SizedBox(height: 15),
              Text(
                "Enter meeting code below",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextField(
                    controller: code_controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Example : abc-efg-dhi"),
                  ),
                ),
              ),
              SizedBox(height: 12),

              ElevatedButton(
                onPressed: () {
                   Get.to(Videocall(channelName: code_controller.text.trim(),));
                },
                child: Text("Join"),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(50, 30),
                  primary: Colors.indigo,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
