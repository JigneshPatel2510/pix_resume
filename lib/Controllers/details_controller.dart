import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
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

  List<dynamic> experience = [];

  addExperience() {
    Map<String, dynamic> experienceDetails = {
      "company_name": companyName,
      "company_address": companyAddress,
      "level_of_position": levelOfPosition,
      "work_year": workYear,
      "experience_description": experienceDescription,
    };

    experience.add(experienceDetails);

    companyName.clear();
    companyAddress.clear();
    levelOfPosition.clear();
    workYear.clear();
    experienceDescription.clear();
  }

  List<dynamic> education = [];

  addEducation() {
    Map<String, dynamic> educationDetails = {
      "degree_name": degreeName,
      "institute_name": instituteName,
      "institute_address": instituteAddress,
      "degree_year": degreeYear,
      "description": degreeDescription,
    };

    experience.add(educationDetails);

    degreeName.clear();
    instituteName.clear();
    instituteAddress.clear();
    degreeYear.clear();
    degreeDescription.clear();
  }

  List<dynamic> certificate = [];

  addCertificate() {
    Map<String, dynamic> certificateDetails = {
      "name_of_certificate": nameOfCertificate,
      "academy_name": academyName,
      "academy_address": academyAddress,
      "certificate_year": certificateYear,
    };

    experience.add(certificateDetails);

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
      // "profile_photo":"",
      "name": fullName.text,
      // "designation": designation,
      "email": email.text,
      // "social_media_link": socialMediaLink,
      // "mobile_number": mobileNumber,
      // "address": address,
      // "summary": summary,
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

      // "skills": skills,
      // "certificates":certificate,   //List
      // "name_of_certificate": nameOfCertificate,
      // "academy_name": academyName,
      // "academy_address": academyAddress,
      // "certificate_year": certificateYear,
      // "languages": languages,
    };

    http.Response response = await http.post(
        Uri.parse("https://codinghouse.in/resume/ResumeBuilder/GeneratePdf"),
        body: body);
    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body);
      var urlData=response.body;
      downloadFile(urlData);
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
    Get.to(Preview(filePath: filePath,));
  }
}
