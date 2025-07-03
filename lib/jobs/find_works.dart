// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class FindWorkPage extends StatefulWidget {
  const FindWorkPage({super.key});

  @override
  State<FindWorkPage> createState() => _FindWorkPageState();
}

class _FindWorkPageState extends State<FindWorkPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _budgetController = TextEditingController();
  final _locationController = TextEditingController();
  final _deadlineController = TextEditingController();
  final _skillsController = TextEditingController();

  String _selectedCategory = 'General';
  String _selectedBudgetType = 'Fixed';
  String _selectedUrgency = 'Medium';

  final List<String> _categories = [
    'General',
    'Home & Garden',
    'Technology',
    'Design & Creative',
    'Writing & Translation',
    'Marketing',
    'Business',
    'Construction',
    'Automotive',
    'Health & Wellness',
    'Education',
    'Event Planning',
  ];

  final List<String> _budgetTypes = ['Fixed', 'Hourly', 'Negotiable'];
  final List<String> _urgencyLevels = ['Low', 'Medium', 'High', 'Urgent'];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _budgetController.dispose();
    _locationController.dispose();
    _deadlineController.dispose();
    _skillsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _deadlineController.text =
            "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _submitJob() {
    if (_formKey.currentState!.validate()) {
      // Handle job submission here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Job posted successfully!'),
          backgroundColor: Colors.green,
        ),
      );
      // You can add navigation or API call here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Post a Job',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: const Color(0xFFE67E22),
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFE67E22).withOpacity(0.1),
                      const Color(0xFFE67E22).withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFE67E22).withOpacity(0.2),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.work_outline,
                      size: 48,
                      color: const Color(0xFFE67E22),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Find the Perfect Worker',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Fill out the details below to post your job and connect with skilled professionals',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Job Title
              _buildSectionTitle('Job Title'),
              TextFormField(
                controller: _titleController,
                decoration: _buildInputDecoration(
                  'Enter job title',
                  Icons.title,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a job title';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Category
              _buildSectionTitle('Category'),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: _buildInputDecoration(
                  'Select category',
                  Icons.category,
                ),
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue!;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Job Description
              _buildSectionTitle('Job Description'),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: _buildInputDecoration(
                  'Describe the job requirements, expectations, and any specific details...',
                  Icons.description,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter job description';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Budget Section
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Budget Type'),
                        DropdownButtonFormField<String>(
                          value: _selectedBudgetType,
                          decoration: _buildInputDecoration(
                            'Budget type',
                            Icons.payment,
                          ),
                          items: _budgetTypes.map((String type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedBudgetType = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Budget Amount'),
                        TextFormField(
                          controller: _budgetController,
                          keyboardType: TextInputType.number,
                          decoration: _buildInputDecoration(
                            _selectedBudgetType == 'Hourly'
                                ? '₹/hour'
                                : '₹ Total',
                            Icons.currency_rupee,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter budget';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Location
              _buildSectionTitle('Location'),
              TextFormField(
                controller: _locationController,
                decoration: _buildInputDecoration(
                  'Enter job location',
                  Icons.location_on,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter location';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Deadline and Urgency
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Deadline'),
                        TextFormField(
                          controller: _deadlineController,
                          readOnly: true,
                          onTap: _selectDate,
                          decoration: _buildInputDecoration(
                            'Select deadline',
                            Icons.calendar_today,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Select deadline';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSectionTitle('Urgency'),
                        DropdownButtonFormField<String>(
                          value: _selectedUrgency,
                          decoration: _buildInputDecoration(
                            'Urgency level',
                            Icons.priority_high,
                          ),
                          items: _urgencyLevels.map((String urgency) {
                            return DropdownMenuItem<String>(
                              value: urgency,
                              child: Row(
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: _getUrgencyColor(urgency),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(urgency),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedUrgency = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Required Skills
              _buildSectionTitle('Required Skills'),
              TextFormField(
                controller: _skillsController,
                decoration: _buildInputDecoration(
                  'e.g., Plumbing, Electrical, Carpentry (separate with commas)',
                  Icons.build,
                ),
              ),

              const SizedBox(height: 32),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _submitJob,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE67E22),
                    foregroundColor: Colors.white,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.publish, size: 24),
                      SizedBox(width: 12),
                      Text(
                        'Post Job',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Save as Draft Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Job saved as draft'),
                        backgroundColor: Colors.blue,
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFE67E22),
                    side: const BorderSide(color: Color(0xFFE67E22)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.save, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Save as Draft',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: const Color(0xFFE67E22)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE67E22), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  Color _getUrgencyColor(String urgency) {
    switch (urgency) {
      case 'Low':
        return Colors.green;
      case 'Medium':
        return Colors.orange;
      case 'High':
        return Colors.red;
      case 'Urgent':
        return Colors.red.shade700;
      default:
        return Colors.grey;
    }
  }
}
