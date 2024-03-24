import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/function/model.dart';
import 'package:image_picker/image_picker.dart';

Addcontroller addcontroller = Get.find<Addcontroller>();

class Addcontroller extends GetxController {
  RxString imagepath = "".obs;
  final formKey = GlobalKey<FormState>();
  addImage(String image) {
    imagepath.value = image;
  }

  final nameController = TextEditingController();
  final classController = TextEditingController();
  final guardianController = TextEditingController();
  final mobileController = TextEditingController();
  initialization() {
    imagepath.value = "";
    nameController.clear();
    classController.clear();
    guardianController.clear();
    mobileController.clear();
  }

  Future<void> addstudentclicked(mtx) async {
    if (formKey.currentState!.validate() &&
        addcontroller.imagepath.isNotEmpty) {
      final name = addcontroller.nameController.text.toUpperCase();
      final classA = addcontroller.classController.text.toString().trim();
      final father = addcontroller.guardianController.text;
      final phonenumber = addcontroller.mobileController.text.trim();

      final stdData = StudentModel(
        name: name,
        classname: classA,
        father: father,
        pnumber: phonenumber,
        imagex: addcontroller.imagepath.value,
      );
      await addstudent(stdData); // Use the correct function name addStudent.

      ScaffoldMessenger.of(mtx).showSnackBar(
        const SnackBar(
          content: Text("Successfully added"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
      Get.back();
    } else {
      ScaffoldMessenger.of(mtx).showSnackBar(
        const SnackBar(
          content: Text('Add Profile Picture '),
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> getimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);

    if (image == null) {
      return;
    }

    addcontroller.addImage(image.path);
  }
   void addphoto(ctxr) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          content: const Text('Profile'),
          actions: [
            IconButton(
              onPressed: () {
                getimage(ImageSource.camera);
                Get.back();
              },
              icon: const Icon(
                Icons.camera_alt_rounded,
                color: Colors.red,
              ),
            ),
            IconButton(
              onPressed: () {
                getimage(ImageSource.gallery);
                Get.back();
              },
              icon: const Icon(
                Icons.image,
                color: Colors.red,
              ),
            ),
          ],
        );
      },
    ); 
}
}
