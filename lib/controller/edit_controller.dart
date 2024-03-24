import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/function/model.dart';
import 'package:image_picker/image_picker.dart';

EditingController editingcontroller = Get.find<EditingController>();

class EditingController extends GetxController {
  RxString updateimagepath = "".obs;
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final classController = TextEditingController();
  final guardianController = TextEditingController();
  final mobileController = TextEditingController();
  addImage(String image) {
    updateimagepath.value = image;
  }

  void initialValues({
    required String imagePaths,
    required String name,
    required String classname,
    required String quardianname,
    required String mobilename,
  }) {
    updateimagepath.value = imagePaths;
    nameController.text = name;
    classController.text = classname;
    guardianController.text = quardianname;
    mobileController.text = mobilename;
  }

  Future<void> getimage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }

    editingcontroller.updateimagepath.value = image.path.toString();
  }

  Future<void> editClick(context, StudentModel student) async {
    if (formKey.currentState!.validate()) {
      final name = editingcontroller.nameController.text.toUpperCase();
      final classname =
          editingcontroller.classController.text.toString().trim();
      final father = editingcontroller.guardianController.text;
      final pnumber = editingcontroller.mobileController.text.trim();

      final updatestudnet = StudentModel(
          name: name,
          classname: classname,
          father: father,
          pnumber: pnumber,
          imagex: updateimagepath.value);
      await editStudent(
        student.id!,
        updatestudnet.name,
        updatestudnet.classname,
        updatestudnet.father,
        updatestudnet.pnumber,
        updatestudnet.imagex,
      );
      getstudentdata();
      Get.back();
    }
  }
   void editphoto(ctxr) {
    showDialog(
      context: ctxr,
      builder: (ctxr) {
        return AlertDialog(
          title: const Text('Update Photo '),
          actions: [
            Column(
              children: [
                Row(
                  children: [
                    const Text('Choose from camera'),
                    IconButton(
                      onPressed: () {
                        getimage(ImageSource.camera);
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Choose from gallery '),
                    IconButton(
                      onPressed: () {
                        getimage(ImageSource.gallery);
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.image,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }

}
