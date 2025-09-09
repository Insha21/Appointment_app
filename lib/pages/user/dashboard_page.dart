import 'package:flutter/material.dart';
import 'doctors_list.dart'; // 👈 import your DoctorsPage

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "User Menu",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Personal Info"),
              onTap: () {
                Navigator.pop(context); // close drawer
                // Add personal info page navigation here
              },
            ),
            ListTile(
              leading:  Image.asset("assets/images/images5.jpeg"),
              title: const Text("Doctors"),
              onTap: () {
                Navigator.pop(context); // close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoctorsPage(), // 👈 Open doctors page
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.asset("assets/images/image2.jpeg"),
              title: const Text("Appoinments"),
              onTap: () {
                Navigator.pop(context); // close drawer
                // Add personal info page navigation here
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context); // close drawer
                // Add personal info page navigation here
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context); // close drawer
                // Add logout logic here
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          "Welcome to Dashboard!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
