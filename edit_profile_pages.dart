import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedCountry;
  String? selectedGender;
  String? selectedStatus;
  DateTime? selectedDate;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 16),

              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    controller: TextEditingController(
                      text: selectedDate == null
                          ? ''
                          : '${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email Address'),
              ),
              SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: selectedCountry,
                items: ['United States', 'Indonesia', 'Japan']
                    .map((country) => DropdownMenuItem(value: country, child: Text(country)))
                    .toList(),
                onChanged: (value) => setState(() => selectedCountry = value),
                decoration: InputDecoration(labelText: 'Country'),
              ),
              SizedBox(height: 16),

              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: selectedGender,
                items: ['Male', 'Female', 'Other']
                    .map((gender) => DropdownMenuItem(value: gender, child: Text(gender)))
                    .toList(),
                onChanged: (value) => setState(() => selectedGender = value),
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: selectedStatus,
                items: ['Student', 'Teacher', 'Professional']
                    .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                    .toList(),
                onChanged: (value) => setState(() => selectedStatus = value),
                decoration: InputDecoration(labelText: 'Status'),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Simpan perubahan profil
                  }
                },
                child: Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}