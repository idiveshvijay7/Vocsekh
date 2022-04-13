import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:uuid/uuid.dart';
// import 'package:vocseekh/widgets/RecentChats.dart';

import '../widgets/RecentChats.dart';
import '../widgets/category_selector.dart';




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          'Ninja Study', 
           style: TextStyle(
           fontSize:  28.0 , 
           fontWeight: FontWeight.bold, 
           ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              iconSize:  30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).


          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            category_selector(),
            Expanded (
              child: Container(
                // height: 500.0,
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  ),
              ),
              child: Column(
                children: <Widget>[
                  RecentChats(),
                ],
              ),
              ),
             ),
          ],
        ),
      ),

      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => 
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) =>  ),
        
      //   // child: const Icon(Icons.message),
      // ),
      //  ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);

//   @override
//   _ChatPageState createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   List<types.Message> _messages = [];
//   final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

//   @override
//   void initState() {
//     super.initState();
//     _loadMessages();
//   }

//   void _addMessage(types.Message message) {
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }

//   void _handleAtachmentPressed() {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: SizedBox(
//             height: 144,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     _handleImageSelection();
//                   },
//                   child: const Align(
//                     alignment: AlignmentDirectional.centerStart,
//                     child: Text('Photo'),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     _handleFileSelection();
//                   },
//                   child: const Align(
//                     alignment: AlignmentDirectional.centerStart,
//                     child: Text('File'),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Align(
//                     alignment: AlignmentDirectional.centerStart,
//                     child: Text('Cancel'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _handleFileSelection() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.any,
//     );

//     if (result != null && result.files.single.path != null) {
//       final message = types.FileMessage(
//         author: _user,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//         id: const Uuid().v4(),
//         mimeType: lookupMimeType(result.files.single.path!),
//         name: result.files.single.name,
//         size: result.files.single.size,
//         uri: result.files.single.path!,
//       );

//       _addMessage(message);
//     }
//   }

//   void _handleImageSelection() async {
//     final result = await ImagePicker().pickImage(
//       imageQuality: 70,
//       maxWidth: 1440,
//       source: ImageSource.gallery,
//     );

//     if (result != null) {
//       final bytes = await result.readAsBytes();
//       final image = await decodeImageFromList(bytes);

//       final message = types.ImageMessage(
//         author: _user,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//         height: image.height.toDouble(),
//         id: const Uuid().v4(),
//         name: result.name,
//         size: bytes.length,
//         uri: result.path,
//         width: image.width.toDouble(),
//       );

//       _addMessage(message);
//     }
//   }

//   void _handleMessageTap(BuildContext context, types.Message message) async {
//     if (message is types.FileMessage) {
//       await OpenFile.open(message.uri);
//     }
//   }

//   void _handlePreviewDataFetched(
//     types.TextMessage message,
//     types.PreviewData previewData,
//   ) {
//     final index = _messages.indexWhere((element) => element.id == message.id);
//     final updatedMessage = _messages[index].copyWith(previewData: previewData);

//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       setState(() {
//         _messages[index] = updatedMessage;
//       });
//     });
//   }

//   void _handleSendPressed(types.PartialText message) {
//     final textMessage = types.TextMessage(
//       author: _user,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: const Uuid().v4(),
//       text: message.text,
//     );

//     _addMessage(textMessage);
//   }

//   void _loadMessages() async {
//     final response = await rootBundle.loadString('assets/messages.json');
//     final messages = (jsonDecode(response) as List)
//         .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
//         .toList();

//     setState(() {
//       _messages = messages;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         bottom: false,
//         child: Chat(
//           messages: _messages,
//           onAttachmentPressed: _handleAtachmentPressed,
//           onMessageTap: _handleMessageTap,
//           onPreviewDataFetched: _handlePreviewDataFetched,
//           onSendPressed: _handleSendPressed,
//           user: _user,
//         ),
//       ),
//     );
//   }
// }