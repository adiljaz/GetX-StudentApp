
import 'package:get/get.dart';
import 'package:h1/function/functions.dart';
import 'package:h1/function/model.dart';

class StudenetController extends GetxController {
  RxList<StudentModel> filterstudent = <StudentModel>[].obs;
  RxList<StudentModel> studenetlist = <StudentModel>[].obs;

  initialize() async {
    dynamic student = getstudentdata();
    studentList.value = await student;
  }

  getsearchdatra(String querry) async {
    await initialize();
    if (querry.isEmpty) {
      filterstudent.value = studenetlist;
    } else {
      List<StudentModel> s = studenetlist
          .where((element) =>
              element.name.toLowerCase().contains(querry.toLowerCase()) ||
              element.classname.toLowerCase().contains(querry.toLowerCase()))
          .toList();
      filterstudent.value = s;
    }
  }
}

 StudenetController  studenetController =Get.find<StudenetController>();
