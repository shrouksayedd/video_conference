import 'package:flutter/material.dart';
import 'package:video_conference/pages/joinwithcode.dart';
import 'package:video_conference/pages/new_meeting.dart';
class Home_page extends StatelessWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( "video coference"),
        centerTitle: true,
        backgroundColor: Colors.indigo ,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 45,),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>New_meeting()));
              },
              icon: Icon(Icons.add),
              label: Text("New Meeting"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 30),
                primary: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Divider( height: 1,),
            ),
            SizedBox(height: 5,),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Joinwithcode()));
              },
              icon: Icon(Icons.margin_outlined,color: Colors.indigo,),
              label: Text("Join With a Code",style:TextStyle(
                color: Colors.indigo,
              ) ,),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 30),
                primary: Colors.white,


                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                side: BorderSide(color: Colors.indigo),
              ),
            ),
            SizedBox(height: 80,),
            Image.network("https://user-images.githubusercontent.com/67534990/127524449-fa11a8eb-473a-4443-962a-07a3e41c71c0.png")


          ],
        ),
      ),
    );
  }
}