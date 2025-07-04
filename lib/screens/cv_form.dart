import 'package:flutter/material.dart';

import 'cv_preview.dart';

class CVFormScreen extends StatefulWidget {
  @override
  _CVFormScreenState createState() => _CVFormScreenState();
}

class _CVFormScreenState extends State<CVFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Your CV")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildTextField(nameController, "Full Name"),
                buildTextField(jobTitleController, "Job Title"),
                buildTextField(emailController, "Email"),
                buildTextField(phoneController, "Phone"),
                buildTextField(experienceController, "Work Experience", maxLines: 3),
                buildTextField(educationController, "Education", maxLines: 2),
                buildTextField(skillsController, "Skills (comma separated)"),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CVPreviewScreen(
                            name: nameController.text,
                            jobTitle: jobTitleController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            experience: experienceController.text,
                            education: educationController.text,
                            skills: skillsController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text("Generate CV"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        maxLines: maxLines,
        validator: (value) => value!.isEmpty ? "This field is required" : null,
      ),
    );
  }
}
