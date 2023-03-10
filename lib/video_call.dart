
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:http/http.dart';

class Videocall extends StatefulWidget {

   String channelName = "test";

   Videocall({required this.channelName});

  @override
  State<Videocall> createState() => _VideocallState();


}




class _VideocallState extends State<Videocall> {
  late final AgoraClient _client;
  bool loading =true;
  String temptoken='';
  @override
  void initState() {
    getToken();
    super.initState();
  }


   Future<void> getToken()async {
     String link = 'https://agora-node-tokenserver.shorouksayed1.repl.co/access_token?channelName=${widget
         .channelName}';
     Response _response = await get(Uri.parse(link));
     Map data = jsonDecode(_response.body);

     setState(() {
       temptoken = data["token"];
     });
     _client = AgoraClient(
         agoraConnectionData: AgoraConnectionData(
           appId: 'd71943d81f2547fb86ca66ac3acf2ad4',
           channelName: widget.channelName,
           tempToken: temptoken,
           // tokenUrl: 'https://agora-node-tokenserver.shorouksayed1.repl.co/access_token?channelName=test',
         ),
         enabledPermission: [
           Permission.camera,
           Permission.microphone,
         ]
     );
     Future.delayed(Duration(seconds: 1)).then(
           (value) => setState(() => loading = false),
     );
   }
  @override
  Widget build(BuildContext context) {
    return loading?CircularProgressIndicator(): Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: _client,layoutType: Layout.floating,),
            AgoraVideoButtons(client: _client)
          ],

        ),
      )
    );
  }
}
