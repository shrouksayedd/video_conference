
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:uuid/uuid.dart';
import 'package:video_conference/video_call.dart';

class New_meeting extends StatefulWidget {
   New_meeting({Key? key}) : super(key: key);

  @override
  State<New_meeting> createState() => _New_meetingState();
}

class _New_meetingState extends State<New_meeting> {
  String _meetingCode = "abcdfgqw";
  @override
  void initState() {
    var uuid = Uuid();

    _meetingCode=uuid.v1().substring(0,8);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_sharp, size: 30,color: Colors.black,), onPressed: () { Navigator.pop(context); },),
      ),
      backgroundColor: Colors.white,
      body:  Column(

          children: [


            SizedBox(height: 90),
            Image.network('https://user-images.githubusercontent.com/67534990/127776392-8ef4de2d-2fd8-4b5a-b98b-ea343b19c03e.png'),
            SizedBox(height: 15),
            Text(
              "Your Meeting",
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
                 child: ListTile(
                  leading: IconButton(icon: Icon(Icons.link), onPressed: () {
                    Share.share("Meeting Code : $_meetingCode");
                  },),
                  title: SelectableText(
                  _meetingCode,
                    style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                 trailing: IconButton(icon: Icon(Icons.copy), onPressed: () {
                   FlutterClipboard.copy(_meetingCode).then(( value ) => print('copied'));
                 },),
            )
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Divider( height: 1,),
            ),
            SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: () {
                Share.share("Meeting Code : $_meetingCode");
              },
              icon: Icon(Icons.arrow_drop_down_outlined),
              label: Text("Share Invite"),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350, 30),
                primary: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
            SizedBox(height: 10,),
            ElevatedButton.icon(
              onPressed: () {
               Get.to(Videocall(channelName: _meetingCode.trim(),));
              },
              icon: Icon(Icons.video_call_rounded,color: Colors.indigo,),
              label: Text("Start Call",style:TextStyle(
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


          ],
      )

    );
  }
}
