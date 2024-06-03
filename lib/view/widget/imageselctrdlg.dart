import 'dart:io';

import 'package:chat/controller/basic_provider.dart';
import 'package:chat/service/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageSelectorDialog extends StatelessWidget {
  const ImageSelectorDialog({
    Key? key,
    required this.pro,
    required this.size,
    required this.recieverId,
  }) : super(key: key);

  final BasicProvider pro;
  final Size size;
  final String recieverId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      content: Text(
        'Select',
        style: GoogleFonts.poppins(fontSize: 20),
      ),
      actions: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  pro.imageSelector(source: ImageSource.camera);
                },
                child: Container(
                  width: size.width * 0.4,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(164, 148, 231, 1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: Color.fromRGBO(164, 148, 231, 1),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Camera',
                          style: TextStyle(
                            color: Color.fromRGBO(164, 148, 231, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  // pro.imageSelector(source: ImageSource.gallery);
                },
                child: Container(
                  width: size.width * 0.4,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(164, 148, 231, 1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.file_copy,
                          color: Color.fromRGBO(164, 148, 231, 1),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'document',
                          style: TextStyle(
                            color: Color.fromRGBO(164, 148, 231, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  pro.imageSelector(source: ImageSource.gallery);
                },
                child: Container(
                  width: size.width * 0.4,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(164, 148, 231, 1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.image,
                          color: Color.fromRGBO(164, 148, 231, 1),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Gallery',
                          style: TextStyle(
                            color: Color.fromRGBO(164, 148, 231, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: size.height * 0.2,
          width: size.width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: pro.selectedimage != null
                  ? FileImage(pro.selectedimage!)
                  : const AssetImage('assets/images/user.jpg') as ImageProvider,
            ),
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            sendImage(recieverId, context);
            Navigator.of(context).pop();
          },
          child: Container(
            height: size.height * 0.06,
            width: size.width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 153, 166, 225),
            ),
            child: Center(
              child: Text(
                "Send",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void sendImage(String recieverid, BuildContext context) async {
    final pro = Provider.of<BasicProvider>(context, listen: false);
    if (pro.selectedimage != null) {
      ChatService().addImageMessage(
        recieverid,
        File(pro.selectedimage!.path),
      );
    }
  }
}
