// import 'dart:io';
// import 'dart:typed_data';
// import 'package:dental_minor/main.dart';
// import 'package:dental_minor/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
// import '../NavBar/CustomNavbar.dart';
// import '../NavBar/items.dart';
//
// import 'package:image/image.dart' as eImg;
//
//
// final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
//   foregroundColor: Colors.black87,
//   backgroundColor: Colors.grey[300],
//   minimumSize: Size(88, 36),
//   padding: EdgeInsets.symmetric(horizontal: 16),
//   shape: const RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(2)),
//   ),
// );
// //
// // class ScanPage extends StatefulWidget {
// //   const ScanPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<ScanPage> createState() => _ScanPageState();
// // }
// //
// // class _ScanPageState extends State<ScanPage> {
// //   CameraImage? cameraImage;
// //   CameraController? cameraController;
// //   String output = '';
// //
// //   loadCamera() {
// //     cameraController = CameraController(cameras![0], ResolutionPreset.medium);
// //     cameraController?.initialize().then((value) {
// //       if (!mounted) {
// //         return;
// //       } else {
// //         setState(() {
// //           cameraController!.startImageStream((imageStream) {
// //             cameraImage = imageStream;
// //
// //             // runModel();
// //           });
// //         });
// //       }
// //     });
// //   }
// //   //
// //   // runModel() async {
// //   //   if (cameraImage != null) {
// //   //     var predictions = await Tflite.runModelOnFrame(
// //   //         bytesList: cameraImage!.planes.map((plane) {
// //   //       return plane.bytes;
// //   //     }).toList(),
// //   //
// //   //     imageHeight: cameraImage!.height,
// //   //       imageWidth: cameraImage!.width,
// //   //       imageMean: 127.5,
// //   //       imageStd: 127.5,
// //   //       threshold: 0.1,
// //   //       rotation: 90,
// //   //       numResults: 2,
// //   //       asynch: true,
// //   //     );
// //   //     predictions!.forEach((element) {
// //   //       setState(() {
// //   //         output = element['lable'];
// //   //       });
// //   //     });
// //   //   }
// //   //
// //   //   loadmodel() async {
// //   //     await Tflite.loadModel(
// //   //         model: "assets/model_unquant.tflite",
// //   //         labels: "assets/labels.txt"
// //   //     );
// //   //   }
// //   // }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: CustomAppbar(title: 'ScanPage',),
// //
// //     );
// //   }
// // }
//
// // class ScanPage extends StatefulWidget {
// //   @override
// //   _ScanPageState createState() => _ScanPageState();
// // }
// //
// // class _ScanPageState extends State<ScanPage> {
// //   bool loading = true;
// //   late File _image;
// //   late List _output;
// //   final imagepicker = ImagePicker();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     loadmodel().then((value) {
// //       setState(() {});
// //     });
// //   }
// //
// //   detectimage(File image) async {
// //     var prediction = await Tflite.runModelOnImage(
// //         path: image.path,
// //         numResults: 2,
// //         threshold: 0.6,
// //         imageMean: 127.5,
// //         imageStd: 127.5);
// //
// //     setState(() {
// //       _output = prediction!;
// //       loading = false;
// //     });
// //   }
// //
// //   loadmodel() async {
// //     await Tflite.loadModel(
// //         model: 'asset/model_unquant.tflite', labels: 'asset/labels.txt');
// //   }
// //
// //   @override
// //   void dispose() {
// //     super.dispose();
// //   }
// //
// //   pickimage_camera() async {
// //     var image = await imagepicker.getImage(source: ImageSource.camera);
// //     if (image == null) {
// //       return null;
// //     } else {
// //       _image = File(image.path);
// //     }
// //     detectimage(_image);
// //   }
// //
// //   pickimage_gallery() async {
// //     var image = await imagepicker.getImage(source: ImageSource.gallery);
// //     if (image == null) {
// //       return null;
// //     } else {
// //       _image = File(image.path);
// //     }
// //     detectimage(_image);
// //   }
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     var h = MediaQuery.of(context).size.height;
// //     var w = MediaQuery.of(context).size.width;
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           'ML Classifier',
// //           style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black),
// //         ),
// //       ),
// //       body: Container(
// //         height: h,
// //         width: w,
// //         child: Column(
// //           children: [
// //             Container(
// //               child: Column(
// //                 children: [
// //                   Container(
// //                     padding: EdgeInsets.only(left: 10, right: 10),
// //                     height: 50,
// //                     width: double.infinity,
// //                     child:
// //                       ElevatedButton(
// //                         style: raisedButtonStyle,
// //                         onPressed: () {
// //                           pickimage_camera();
// //                         },
// //                         child: Text(
// //                           'Capture',
// //                           style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
// //                         ),
// //                       ),
// //                     // RaisedButton(
// //                     //     color: Colors.teal[800],
// //                     //     shape: RoundedRectangleBorder(
// //                     //         borderRadius: BorderRadius.circular(10)),
// //                     //     child: Text('Capture',
// //                     //         style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),),
// //                     //     onPressed: () {
// //                     //       pickimage_camera();
// //                     //     }
// //                     //     ),
// //                   ),
// //                   SizedBox(height: 10),
// //                   Container(
// //                     padding: EdgeInsets.only(left: 10, right: 10),
// //                     height: 50,
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       style: raisedButtonStyle,
// //                       onPressed: () {
// //                         pickimage_camera();
// //                       },
// //                       child: Text(
// //                         'Pick',
// //                         style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),
// //                       ),
// //                     )
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             loading != true
// //                 ? Container(
// //               child: Column(
// //                 children: [
// //                   Container(
// //                     height: 220,
// //                     // width: double.infinity,
// //                     padding: EdgeInsets.all(15),
// //                     child: Image.file(_image),
// //                   ),
// //                   _output != null
// //                       ? Text(
// //                       (_output[0]['label']).toString().substring(2),
// //                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),)
// //                       : Text(''),
// //                   _output != null
// //                       ? Text(
// //                       'Confidence: ' +
// //                           (_output[0]['confidence']).toString(),
// //                       style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black),)
// //                       : Text('')
// //                 ],
// //               ),
// //             )
// //                 : Container()
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// //
// // class ScanPage extends StatefulWidget {
// //   const ScanPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<ScanPage> createState() => _ScanPageState();
// // }
// //
// // class _ScanPageState extends State<ScanPage> {
// //
// //   late bool loading = true;  // changed to true
// //   File? image;
// //   List<dynamic>? outputs;
// //   final imagePicker = ImagePicker();
// //   late Interpreter interpreter;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     // loading = true;
// //     loadModel().then((value) {
// //       setState(() {
// //         loading = false;
// //       });
// //     });
// //   }
// //
// //   Future<void> loadModel() async {
// //     // changes acc. to tflite_flutter
// //     interpreter = await Interpreter.fromAsset('model_unquant.tflite');
// //     // await Tflite.loadModel(
// //     //     model: "asset/model_unquant.tflite", labels: "asset/labels.txt");
// //   }
// //
// //   Future<void> pickImage() async {
// //     var img = await imagePicker.getImage(source: ImageSource.gallery);
// //
// //     if (img == null) {
// //       return null;
// //     }
// //     setState(() {
// //       loading = true;
// //       image = File(img.path);
// //     });
// //
// //     if(image != null) {
// //       classifyImage(image!);
// //     }
// //   }
// //
// //  Future<void> classifyImage(File image) async {
// //
// //    var input = image.readAsBytesSync();
// //
// //     var output = List.filled(2,0).reshape([1,2]);
// //
// //     interpreter.run(input, output);
// //
// //     setState(() {
// //       loading = false;
// //       // declaring the list in the class which will help to show the classes name and confidence rate
// //       outputs = output.toList();
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: CustomAppbar(
// //         title: 'ScanPage',
// //       ),
// //       body: loading
// //           ? Container(
// //               alignment: Alignment.center,
// //               child: CircularProgressIndicator(),
// //             )
// //           : Container(
// //               width: MediaQuery.of(context).size.width,
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   image != null
// //                       ? Container(
// //                           child: Image.file(image!),
// //                           height: 500,
// //                           width: MediaQuery.of(context).size.width - 200,
// //                         )
// //                         : Container(),
// //                   SizedBox(
// //                     height: 20,
// //                   ),
// //                   outputs != null
// //                       ? Text(
// //                           "${outputs![0]}"
// //                               .replaceAll(RegExp(r'[0-9]'), ''),
// //                           style: Theme.of(context)
// //                               .textTheme
// //                               .bodyMedium!
// //                               .copyWith(color: Colors.black),
// //                         )
// //                       : Text("Classification Waiting"),
// //                 ],
// //               ),
// //             ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: pickImage,
// //         tooltip: 'increment',
// //         child: Icon(Icons.add),
// //       ),
// //       bottomNavigationBar: CustomBottomNavigationBar(
// //         items: items,
// //         onTap: (int index) {
// //           switch (index) {
// //             case 0:
// //               Navigator.pop(context);
// //               break;
// //             case 1:
// //               // do nothing
// //               break;
// //             case 2:
// //               Navigator.pushNamed(context, '/location');
// //               break;
// //             case 3:
// //               Navigator.pushNamed(context, '/calendar');
// //               break;
// //             case 4:
// //               Navigator.pushNamed(context, '/task');
// //               break;
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
//
// //
// // class ScanPage extends StatefulWidget {
// //   const ScanPage({Key? key}) : super(key: key);
// //
// //   @override
// //   State<ScanPage> createState() => _ScanPageState();
// // }
// //
// // class _ScanPageState extends State<ScanPage> {
// //   late bool loading = true;
// //   File? _image;
// //   List<dynamic>? outputs;
// //   final imagePicker = ImagePicker();
// //   late Interpreter interpreter;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     loadModel().then((value) {
// //       setState(() {
// //         loading = false;
// //       });
// //     });
// //   }
// //
// //   Future<void> loadModel() async {
// //     interpreter = await Interpreter.fromAsset('model_unquant.tflite');
// //   }
// //
// //   Future<void> pickImage() async {
// //     var img = await imagePicker.pickImage(source: ImageSource.gallery);
// //
// //     if (img == null) {
// //       return null;
// //     }
// //     setState(() {
// //       loading = true;
// //       _image = File(img.path);
// //     });
// //
// //     if (_image != null) {
// //       classifyImage(_image!);
// //     }
// //   }
// //
// //   Future<void> classifyImage(File image) async {
// //     var rawBytes = image.readAsBytesSync();
// //
// //     // Preprocess the image to match the expected input shape
// //     var preprocessedImage = preprocessImage(rawBytes, inputSize: 224);
// //
// //     var inputTensor = interpreter.getInputTensor(0);
// //     var outputTensor = interpreter.getOutputTensor(0);
// //
// //     if (inputTensor.shape != [1, 224, 224, 3]) {
// //       print('Invalid input tensor shape: ${inputTensor.shape}');
// //       return;
// //     }
// //
// //     var output = List.filled(outputTensor.shape[1], 0).reshape([1, outputTensor.shape[1]]);
// //
// //     if (outputTensor.type != TfLiteType.float32) {
// //       print('Invalid output tensor type: ${outputTensor.type}');
// //       return;
// //     }
// //
// //     interpreter.run(preprocessedImage, output);
// //
// //     setState(() {
// //       loading = false;
// //       outputs = output.toList();
// //     });
// //   }
// //
// //   Uint8List preprocessImage(Uint8List rawBytes, {required int inputSize}) {
// //     var image = eImg.decodeImage(rawBytes);
// //
// //     // Resize the image to match the input size of the model
// //     var resizedImage = eImg.copyResize(image!, width: inputSize, height: inputSize);
// //
// //     // Normalize pixel values to the range of 0-1
// //     var normalizedImage = Float32List(3 * inputSize * inputSize);
// //     var buffer = ByteData.view(normalizedImage.buffer);
// //     var index = 0;
// //     for (var y = 0; y < inputSize; y++) {
// //       for (var x = 0; x < inputSize; x++) {
// //         var pixel = resizedImage.getPixel(x, y);
// //         var r = pixel[0] / 255.0;
// //         var g = pixel[1] / 255.0;
// //         var b = pixel[2] / 255.0;
// //         buffer.setFloat32(index, r);
// //         buffer.setFloat32(index + 4, g);
// //         buffer.setFloat32(index + 8, b);
// //         index += 12;
// //       }
// //     }
// //
// //     return normalizedImage.buffer.asUint8List();
// //   }
// //
// //   // Future<void> classifyImage(File image) async {
// //   //   var input = image.readAsBytesSync();
// //   //
// //   //   var output = List.filled(interpreter.getOutputTensor(0).shape[1], 0).reshape([1, interpreter.getOutputTensor(0).shape[1]]);
// //   //
// //   //   interpreter.run(input, output);
// //   //
// //   //   setState(() {
// //   //     loading = false;
// //   //     outputs = output.toList();
// //   //   });
// //   // }
// //
// //   @override
// //   void dispose() {
// //     interpreter.close();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: CustomAppbar(
// //         title: 'ScanPage',
// //       ),
// //       body: loading
// //           ? Container(
// //         alignment: Alignment.center,
// //         child: CircularProgressIndicator(),
// //       )
// //           : Container(
// //         width: MediaQuery.of(context).size.width,
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             if (_image != null)
// //               Container(
// //                 child: Image.file(_image!),
// //                 height: 500,
// //                 width: MediaQuery.of(context).size.width - 200,
// //               ),
// //             const SizedBox(height: 20),
// //             outputs != null
// //                 ? Text(
// //               "${outputs![0]}"
// //                   .replaceAll(RegExp(r'[0-9]'), ''),
// //               style: Theme.of(context)
// //                   .textTheme
// //                   .bodyMedium!
// //                   .copyWith(color: Colors.black),
// //             )
// //                 : Text("Classification Waiting"),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: pickImage,
// //         tooltip: 'increment',
// //         child: Icon(Icons.add),
// //       ),
// //       bottomNavigationBar: CustomBottomNavigationBar(
// //         items: items,
// //         onTap: (int index) {
// //           switch (index) {
// //             case 0:
// //               Navigator.pop(context);
// //               break;
// //             case 1:
// //             // do nothing
// //               break;
// //             case 2:
// //               Navigator.pushNamed(context, '/location');
// //               break;
// //             case 3:
// //               Navigator.pushNamed(context, '/calendar');
// //               break;
// //             case 4:
// //               Navigator.pushNamed(context, '/task');
// //               break;
// //           }
// //         },
// //       ),
// //     );
// //   }
// // }
// //
//
//
//
//
//
// // final try
//
//
// class ScanPage extends StatefulWidget {
//   const ScanPage({Key? key}) : super(key: key);
//
//   @override
//   _ScanPageState createState() => _ScanPageState();
// }
//
// class _ScanPageState extends State<ScanPage> {
//
//   late File _image;
//   late List _results;
//   bool imageSelect=false;
//   @override
//   void initState()
//   {
//     super.initState();
//     loadModel();
//   }
//   Future loadModel()
//   async {
//     Tflite.close();
//     String res;
//     res=(await Tflite.loadModel(model: "assets/model_unquant.tflite",labels: "assets/labels.txt"))!;
//     print("Models loading status: $res");
//   }
//
//   Future imageClassification(File image)
//   async {
//     final List? recognitions = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 6,
//       threshold: 0.05,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//     setState(() {
//       _results=recognitions!;
//       _image=image;
//       imageSelect=true;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Image Classification"),
//       ),
//       body: ListView(
//         children: [
//           (imageSelect)?Container(
//             margin: const EdgeInsets.all(10),
//             child: Image.file(_image),
//           ):Container(
//             margin: const EdgeInsets.all(10),
//             child: const Opacity(
//               opacity: 0.8,
//               child: Center(
//                 child: Text("No image selected"),
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Column(
//               children: (imageSelect)?_results.map((result) {
//                 return Card(
//                   child: Container(
//                     margin: EdgeInsets.all(10),
//                     child: Text(
//                       "${result['label']} - ${result['confidence'].toStringAsFixed(2)}",
//                       style: const TextStyle(color: Colors.red,
//                           fontSize: 20),
//                     ),
//                   ),
//                 );
//               }).toList():[],
//
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: pickImage,
//         tooltip: "Pick Image",
//         child: const Icon(Icons.image),
//       ),
//     );
//   }
//   Future pickImage()
//   async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? pickedFile = await _picker.pickImage(
//       source: ImageSource.gallery,
//     );
//     File image=File(pickedFile!.path);
//     imageClassification(image);
//   }
// }
