import 'package:cv_app/data/my_models/basics/basics_model.dart';
import 'package:cv_app/data/my_models/certificate/certificate_model.dart';
import 'package:cv_app/data/my_models/education/education_model.dart';
import 'package:cv_app/data/my_models/interest/interest_model.dart';
import 'package:cv_app/data/my_models/language/language_model.dart';
import 'package:cv_app/data/my_models/meta/meta_model.dart';
import 'package:cv_app/data/my_models/project/project_model.dart';
import 'package:cv_app/data/my_models/skill/skill_model.dart';
import 'package:cv_app/data/my_models/soft_skill/soft_skill_model.dart';
import 'package:cv_app/data/my_models/work/work_model.dart';

class CvModel {
  final String jobLocation;
  final int salary;
  final BasicsModel basicsModel;
  final MetaModel metaModel;
  final List<WorkModel> workModels;
  final List<LanguageModel> languageModels;
  final List<InterestModel> interestModels;
  final List<ProjectModel> projectModels;
  final List<SkillModel> skillModels;
  final List<SoftSkillModel> softSkillModels;
  final List<EducationModel> educationModels;
  final List<CertificateModel> certificateModels;

  CvModel({
    required this.salary,
    required this.jobLocation,
    required this.metaModel,
    required this.basicsModel,
    required this.workModels,
    required this.languageModels,
    required this.interestModels,
    required this.projectModels,
    required this.skillModels,
    required this.softSkillModels,
    required this.educationModels,
    required this.certificateModels,
  });

  Map<String, dynamic> toJson() {
    return {
      "basics": basicsModel.toJson(),
      "work": workModels.map((toElement) => toElement.toJson()).toList(),
      "projects": projectModels.map((toElement) => toElement.toJson()).toList(),
      "job_location": jobLocation,
      "education":
          educationModels.map((toElement) => toElement.toJson()).toList(),
      "certificates":
          certificateModels.map((toElement) => toElement.toJson()).toList(),
      "salary": salary,
      "skills": skillModels.map((toElement) => toElement.toJson()).toList(),
      "softSkills":
          softSkillModels.map((toElement) => toElement.toJson()).toList(),
      "languages":
          languageModels.map((toElement) => toElement.toJson()).toList(),
      "interests":
          interestModels.map((toElement) => toElement.toJson()).toList(),
      "meta": metaModel.toJson()
    };
  }
}
