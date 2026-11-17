import 'package:flutter/material.dart';

class ContactModel {
  final String name;
  final String email;
  final String phone;
  final String imagePath;

  ContactModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.imagePath,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> _contacts = [
    ContactModel(
      name: 'Leo Messi',
      email: 'leomessi.route@gmail.com',
      phone: '+200000000000',
      imagePath: 'assets/images/leo messi.png',
    ),
    ContactModel(
      name: 'El-balf',
      email: 'elbalf.route@gmail.com',
      phone: '+201666666666',
      imagePath: 'assets/images/elbalf.png',
    ),
    ContactModel(
      name: 'GOAT',
      email: 'leomessi.route@gmail.com',
      phone: '+200000000000',
      imagePath: 'assets/images/messi.png',
    ),
    ContactModel(
      name: 'Leo Messi',
      email: 'leomessi.route@gmail.com',
      phone: '+200000000000',
      imagePath: 'assets/images/mes.png',
    ),
  ];

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  void _deleteAllContacts() {
    setState(() {
      _contacts.clear();
    });
  }

  void _showAddContactModal() {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF004182),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            top: 24,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Indicator Bar
                Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Form Fields
                TextField(
                  controller: nameController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter User Name',
                    hintStyle: const TextStyle(color: Colors.white60),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white70, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter User Email',
                    hintStyle: const TextStyle(color: Colors.white60),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white70, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                ),
                const SizedBox(height: 12),

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter User Phone',
                    hintStyle: const TextStyle(color: Colors.white60),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white70, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: Colors.white, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  ),
                ),
                const SizedBox(height: 20),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty) {
                        setState(() {
                          _contacts.add(
                            ContactModel(
                              name: nameController.text,
                              email: emailController.text.isEmpty
                                  ? 'example@email.com'
                                  : emailController.text,
                              phone: phoneController.text.isEmpty
                                  ? '+200000000000'
                                  : phoneController.text,
                              imagePath: 'assets/images/leo messi.png',
                            ),
                          );
                        });
                        Navigator.of(ctx).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF1D0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: const Text(
                      'Enter user',
                      style: TextStyle(
                        color: Color(0xFF004182),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF004182),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Header (Route Logo)
            Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 16.0, bottom: 8.0),
              child: Image.asset(
                'assets/images/route_logo.png',
                height: 38,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Text(
                  'Route',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Content Area (Grid or Empty State)
            Expanded(
              child: _contacts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/empty_contacts.png',
                            width: 140,
                            height: 140,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.view_list, color: Color(0xFFFFF1D0), size: 80),
                          ),
                          const SizedBox(height: 32),
                          const Text(
                            'There is No Contacts Added Here',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                      child: GridView.builder(
                        itemCount: _contacts.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 14,
                          childAspectRatio: 0.63,
                        ),
                        itemBuilder: (context, index) {
                          final contact = _contacts[index];
                          return _ContactCard(
                            contact: contact,
                            onDelete: () => _deleteContact(index),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),

      // Floating Action Buttons (Delete All + Add Contact)
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_contacts.isNotEmpty) ...[
            FloatingActionButton(
              heroTag: 'delete_all_fab',
              onPressed: _deleteAllContacts,
              backgroundColor: const Color(0xFFF2583E),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 26,
              ),
            ),
            const SizedBox(height: 12),
          ],
          FloatingActionButton(
            heroTag: 'add_contact_fab',
            onPressed: _showAddContactModal,
            backgroundColor: const Color(0xFFFFF1D0),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: const Icon(
              Icons.add,
              color: Color(0xFF004182),
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback onDelete;

  const _ContactCard({
    required this.contact,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1D0),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Image with Name Badge
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      contact.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: const Color(0xFF004182),
                        child: const Icon(Icons.person, color: Colors.white, size: 48),
                      ),
                    ),
                  ),
                ),
                // Name Tag Pill
                Positioned(
                  left: 8,
                  bottom: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      contact.name,
                      style: const TextStyle(
                        color: Color(0xFF29384D),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Info Section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email Row
                Row(
                  children: [
                    const Icon(
                      Icons.email,
                      size: 15,
                      color: Color(0xFF29384D),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        contact.email,
                        style: const TextStyle(
                          color: Color(0xFF29384D),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Phone Row
                Row(
                  children: [
                    const Icon(
                      Icons.phone,
                      size: 15,
                      color: Color(0xFF29384D),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        contact.phone,
                        style: const TextStyle(
                          color: Color(0xFF29384D),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Delete Button
                SizedBox(
                  width: double.infinity,
                  height: 34,
                  child: ElevatedButton.icon(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 16,
                    ),
                    label: const Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF2583E),
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
