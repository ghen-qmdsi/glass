// import 'package:footer/footer.dart';
// import 'package:footer/footer_view.dart';

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: new Text('Footer View Example')),
//     body: new FooterView(
//       children: <Widget>[
//         new Padding(
//           padding: new EdgeInsets.only(top: 200.0),
//           child: Center(
//             child: new Text('Scrollable View'),
//           ),
//         ),
//       ],
//       footer: new Footer(
//         child: Text('I am a Customizable footer!!'),
//         padding: EdgeInsets.all(10.0),
//       ),
//       flex: 1, //default flex is 2
//     ),
//   );
// }

// Row(
//         children: [
//           Expanded(
//             child: EasyStepper(
//               activeStep: activeStep,
//               // lineLength: 70,
//               // lineSpace: 0,
//               // lineType: LineType.normal,
//               // defaultLineColor: Colors.white,
//               // finishedLineColor: Colors.orange,
//               activeStepTextColor: Colors.black87,
//               finishedStepTextColor: Colors.black87,
//               internalPadding: 0,
//               showLoadingAnimation: false,
//               stepRadius: 8,
//               showStepBorder: false,
//               // lineDotRadius: 1.5,
//               steps: [
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 0 ? Colors.orange : Colors.white,
//                     ),
//                   ),
//                   title: 'Waiting',
//                 ),
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 1 ? Colors.orange : Colors.white,
//                     ),
//                   ),
//                   title: 'Order Received',
//                   topTitle: true,
//                 ),
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 2 ? Colors.orange : Colors.white,
//                     ),
//                   ),
//                   title: 'Preparing',
//                 ),
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 3 ? Colors.orange : Colors.white,
//                     ),
//                   ),
//                   title: 'On Way',
//                   topTitle: true,
//                 ),
//                 EasyStep(
//                   customStep: CircleAvatar(
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: CircleAvatar(
//                       radius: 7,
//                       backgroundColor:
//                           activeStep >= 4 ? Colors.orange : Colors.white,
//                     ),
//                   ),
//                   title: 'Delivered',
//                 ),
//               ],
//               onStepReached: (index) {
//                 setState(() {
//                   activeStep = index;
//                 });
//               },
//             ),
//           ),
//         ],
//       )

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GlassMorphicHome(),
    );
  }
}

class GlassMorphicHome extends StatefulWidget {
  const GlassMorphicHome({super.key});

  @override
  State<GlassMorphicHome> createState() => _GlassMorphicHomeState();
}

class _GlassMorphicHomeState extends State<GlassMorphicHome> {
  late DropzoneViewController controller;
  String? imageUrl; // To store the uploaded image URL.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        child: Stack(
          children: [
            DropzoneView(
              onCreated: (DropzoneViewController ctrl) {
                controller = ctrl;
              },
              onDropFile: acceptFile,
            ),
            Center(
              child: DottedBorder(
                dashPattern: [6],
                color: Colors.black,
                strokeWidth: 2,
                padding: EdgeInsets.all(12),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    minimumSize: Size(200, 200), // Fixed size for the button
                  ),
                  onPressed: () {},
                  child: imageUrl == null
                      ? SizedBox(
                          width: 200, // Ensure the width is fixed
                          height: 200, // Ensure the height is fixed
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.add, size: 50), // Adjust icon size
                              SizedBox(height: 10),
                              Text(
                                'Take a Picture',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                            width: 200, // Match button size
                            height: 200,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> acceptFile(dynamic event) async {
    final url = await controller.createFileUrl(event);
    setState(() {
      imageUrl = url; // Update the image URL to display it.
    });
  }
}
