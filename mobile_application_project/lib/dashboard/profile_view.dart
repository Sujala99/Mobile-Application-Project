import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // Initialize the fields with dummy data
    _nameController.text = "John Doe";
    _phoneController.text = "123-456-7890";
    _birthdayController.text = "1990-01-01";
    _emailController.text = "john.doe@example.com";
  }

  void _toggleEditSave() {
    setState(() {
      _isEditing = !_isEditing;
    });

    if (!_isEditing) {
      // Save functionality
      debugPrint("Saved Details:");
      debugPrint("Name: ${_nameController.text}");
      debugPrint("Phone: ${_phoneController.text}");
      debugPrint("Birthday: ${_birthdayController.text}");
      debugPrint("Email: ${_emailController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit),
            onPressed: _toggleEditSave,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "data:image/jpeg;base64,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"), // Placeholder image
                  ),
                  if (_isEditing)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.blue,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(Icons.camera_alt, size: 15),
                          color: const Color(0xFFF4E8FF),
                          onPressed: () {
                            // Add functionality to change profile picture
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Full Name",
              controller: _nameController,
              isEnabled: _isEditing,
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Phone Number",
              controller: _phoneController,
              isEnabled: _isEditing,
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Birthday",
              controller: _birthdayController,
              isEnabled: _isEditing,
              icon: Icons.calendar_today,
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              label: "Email",
              controller: _emailController,
              isEnabled: _isEditing,
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _toggleEditSave,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(_isEditing ? "Save" : "Edit"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool isEnabled = false,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      enabled: isEnabled,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
