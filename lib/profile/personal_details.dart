import 'package:flutter/material.dart';

class PersonalDetailsPage extends StatefulWidget {
  const PersonalDetailsPage({super.key});

  @override
  State<PersonalDetailsPage> createState() => _PersonalDetailsPageState();
}

class _PersonalDetailsPageState extends State<PersonalDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  // Dummy user data (you can replace this with data from a provider or backend)
  String name = 'Ravi Sharma';
  String phone = '9876543210';
  String email = 'ravi.sharma@example.com';
  String gender = 'Male';
  String location = 'Delhi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Details'),
        backgroundColor: const Color(0xFFE67E22),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildTextField(label: 'Name', value: name, onChanged: (val) => name = val),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Phone Number',
                value: phone,
                keyboardType: TextInputType.phone,
                onChanged: (val) => phone = val,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                label: 'Email',
                value: email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val) => email = val,
              ),
              const SizedBox(height: 16),
              _buildDropdownField(
                label: 'Gender',
                value: gender,
                items: ['Male', 'Female', 'Other'],
                onChanged: (val) => setState(() => gender = val),
              ),
              const SizedBox(height: 16),
              _buildTextField(label: 'Location', value: location, onChanged: (val) => location = val),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE67E22),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Details saved')),
                    );
                  }
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String value,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      initialValue: value,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey[100],
      ),
      validator: (val) => val == null || val.isEmpty ? 'Please enter $label' : null,
      onChanged: onChanged,
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
    required Function(String) onChanged,
  }) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Colors.grey[100],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          onChanged: (val) => onChanged(val!),
          items: items
              .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
