import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pix_resume/pdf_preview.dart';

class DetailsController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController socialMediaLink = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController summary = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
  TextEditingController levelOfPosition = TextEditingController();
  TextEditingController workYear = TextEditingController();
  TextEditingController experienceDescription = TextEditingController();
  TextEditingController degreeName = TextEditingController();
  TextEditingController instituteName = TextEditingController();
  TextEditingController instituteAddress = TextEditingController();
  TextEditingController degreeYear = TextEditingController();
  TextEditingController degreeDescription = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController nameOfCertificate = TextEditingController();
  TextEditingController academyName = TextEditingController();
  TextEditingController academyAddress = TextEditingController();
  TextEditingController certificateYear = TextEditingController();
  TextEditingController languages = TextEditingController();
  XFile? pImage;
  String? pBase64Image;

  String template="";
  RxBool isLoading = false.obs;

  // final ImagePicker picker = ImagePicker();

  Future<bool> pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    File imageFile = File(image!.path);
    List<int> imageBytes = await imageFile.readAsBytes();
    String base64Image = base64Encode(imageBytes);
    if (image != null) {
      pImage = image;
      pBase64Image = base64Image;
      return true;
    } else {
      return false;
    }
  }

  RxList<dynamic> experience = [].obs;

  addExperience() {
    Map<String, dynamic> experienceDetails = {
      "company_name": companyName.text,
      "company_address": companyAddress.text,
      "level_of_position": levelOfPosition.text,
      "work_year": workYear.text,
      "experience_description": experienceDescription.text,
    };

    experience.add(experienceDetails);

    companyName.clear();
    companyAddress.clear();
    levelOfPosition.clear();
    workYear.clear();
    experienceDescription.clear();
  }

  RxList<dynamic> education = [].obs;

  addEducation() {
    Map<String, dynamic> educationDetails = {
      "degree_name": degreeName.text,
      "institute_name": instituteName.text,
      "institute_address": instituteAddress.text,
      "degree_year": degreeYear.text,
      "description": degreeDescription.text,
    };

    education.add(educationDetails);

    degreeName.clear();
    instituteName.clear();
    instituteAddress.clear();
    degreeYear.clear();
    degreeDescription.clear();
  }

  RxList<dynamic> certificate = [].obs;

  addCertificate() {
    Map<String, dynamic> certificateDetails = {
      "name_of_certificate": nameOfCertificate.text,
      "academy_name": academyName.text,
      "academy_address": academyAddress.text,
      "certificate_year": certificateYear.text,
    };

    certificate.add(certificateDetails);

    nameOfCertificate.clear();
    academyName.clear();
    academyAddress.clear();
    certificateYear.clear();
  }

  RxList<dynamic> skillList = [].obs;
  RxList<dynamic> selectedSkillList = [].obs;

  Future<void> getSkill() async {
    var response = await http.get(
        Uri.parse("https://codinghouse.in/platter/general/get_sub_skills"));
    var skillData = jsonDecode(response.body);
    skillList.value = skillData["data"];
  }

  showPreview() async {
    var body = {
      "temp_name": template,
      // "profile_photo": pBase64Image,
      "name": fullName.text,
      // "designation": designation.text,
      // "email": email.text,
      // "social_media_link": socialMediaLink.text,
      // "mobile_number": mobileNumber.text,
      // "address": address.text,
      // "summary": summary.text,
      // "work_experience":experience,   //List
      // "company_name": companyName,
      // "company_address": companyAddress,
      // "level_of_position": companyAddress,
      // "work_year": workYear,
      // "experience_description": experienceDescription,

      // "education":education,    //List
      // "degree_name": degreeName,
      // "institute_name": instituteName,
      // "institute_address": instituteAddress,
      // "degree_year": degreeYear,
      // "degree_description": degreeDescription,

      // "skills": skills.text,
      // "certificates":certificate,   //List
      // "name_of_certificate": nameOfCertificate,
      // "academy_name": academyName,
      // "academy_address": academyAddress,
      // "certificate_year": certificateYear,
      // "languages": languages.text,
    };

    isLoading.value=true;

    http.Response response = await http.post(
        Uri.parse("https://codinghouse.in/resume/ResumeBuilder/GeneratePdf1"),
        body: body);
    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body);
      var urlData = response.body;
      downloadFile(urlData);
      isLoading.value=false;
    }
  }

  RxBool downloading = false.obs;

  Future<void> downloadFile(String url) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/jignesh.pdf';

    downloading.value = true;
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    downloading.value = false;
    Get.to(Preview(
      filePath: filePath,
    ));
  }

  showValidator({msg}){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM ,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black38,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


RxList templatesList=[].obs;

  Future<void> showTemplates() async {
    templatesList.clear();
    isLoading.value=true;
  var response = await http.get(Uri.parse("https://codinghouse.in/resume/ResumeBuilder/GetTemplates"));

  if(response.statusCode==200){
    var templatesData=jsonDecode(response.body);
    isLoading.value=true;
    templatesList.value=templatesData["data"];
    isLoading.value=false;

  }


}


}
