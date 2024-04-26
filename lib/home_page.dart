import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _name = '';
  String _phone = '';
  String _email = '';
  String _location = '';
  String _professionalSummary = '';

  final List<String> _skills = [];
  final List<String> _education = [];
  final List<String> _experience = [];
  final List<String> _projects = [];

  void _updatePersonalDetails(
      String name, String phone, String email, String location) {
    setState(() {
      _name = name;
      _phone = phone;
      _email = email;
      _location = location;
    });
  }

  void _updateProfessionalSummary(String professionalSummary) {
    setState(() {
      _professionalSummary = professionalSummary;
    });
  }

  void _addSkill(String skill) {
    setState(() {
      _skills.add(skill);
    });
  }

  void _updateSkill(int index, String skill) {
    setState(() {
      _skills[index] = skill;
    });
  }

  void _deleteSkill(int index) {
    setState(() {
      _skills.removeAt(index);
    });
  }

  void _addEducation(String education) {
    setState(() {
      _education.add(education);
    });
  }

  void _updateEducation(int index, String education) {
    setState(() {
      _education[index] = education;
    });
  }

  void _deleteEducation(int index) {
    setState(() {
      _education.removeAt(index);
    });
  }

  void _addExperience(String experience) {
    setState(() {
      _experience.add(experience);
    });
  }

  void _updateExperience(int index, String experience) {
    setState(() {
      _experience[index] = experience;
    });
  }

  void _deleteExperience(int index) {
    setState(() {
      _experience.removeAt(index);
    });
  }

  void _addProject(String project) {
    setState(() {
      _projects.add(project);
    });
  }

  void _updateProject(int index, String project) {
    setState(() {
      _projects[index] = project;
    });
  }

  void _deleteProject(int index) {
    setState(() {
      _projects.removeAt(index);
    });
  }

  void _generatePdf() {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Personal Details:',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Name: $_name'),
              pw.Text('Phone: $_phone'),
              pw.Text('Email: $_email'),
              pw.Text('Location: $_location'),
              pw.SizedBox(height: 20),
              pw.Text('Professional Summary:',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text(_professionalSummary),
              pw.SizedBox(height: 20),
              pw.Text('Skills:',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Column(
                  children: _skills.map((skill) => pw.Text(skill)).toList()),
              pw.SizedBox(height: 20),
              pw.Text('Education:',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Column(
                  children: _education
                      .map((education) => pw.Text(education))
                      .toList()),
              pw.SizedBox(height: 20),
              pw.Text('Experience:',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Column(
                  children: _experience
                      .map((experience) => pw.Text(experience))
                      .toList()),
              pw.SizedBox(height: 20),
              pw.Text('Projects:',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Column(
                  children:
                      _projects.map((project) => pw.Text(project)).toList()),
              pw.SizedBox(height: 20),
            ],
          );
        },
      ),
    );
    Printing.layoutPdf(onLayout: (PdfPageFormat format) => pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Builder'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Personal Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => _name = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone'),
              onChanged: (value) => _phone = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => _email = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Location'),
              onChanged: (value) => _location = value,
            ),
            SizedBox(height: 16),
            Text('Professional Summary',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            TextFormField(
              decoration:
                  InputDecoration(hintText: 'Enter professional summary'),
              onChanged: (value) => _professionalSummary = value,
              maxLines: null,
            ),
            SizedBox(height: 16),
            Text('Skills',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _skills.length,
              itemBuilder: (context, index) => ListTile(
                title: TextField(
                  decoration: InputDecoration(labelText: 'Skill ${index + 1}'),
                  onChanged: (value) => _updateSkill(index, value),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteSkill(index),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _addSkill(''),
              child: Text('Add Skill'),
            ),
            SizedBox(height: 16),
            Text('Education',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _education.length,
              itemBuilder: (context, index) => ListTile(
                title: TextField(
                  decoration:
                      InputDecoration(labelText: 'Education ${index + 1}'),
                  onChanged: (value) => _updateEducation(index, value),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteEducation(index),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _addEducation(''),
              child: Text('Add Education'),
            ),
            SizedBox(height: 16),
            Text('Experience',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _experience.length,
              itemBuilder: (context, index) => ListTile(
                title: TextField(
                  decoration:
                      InputDecoration(labelText: 'Experience ${index + 1}'),
                  onChanged: (value) => _updateExperience(index, value),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteExperience(index),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _addExperience(''),
              child: Text('Add Experience'),
            ),
            SizedBox(height: 16),
            Text('Projects',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _projects.length,
              itemBuilder: (context, index) => ListTile(
                title: TextField(
                  decoration:
                      InputDecoration(labelText: 'Project ${index + 1}'),
                  onChanged: (value) => _updateProject(index, value),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _deleteProject(index),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _addProject(''),
              child: Text('Add Project'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _generatePdf,
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }
}
