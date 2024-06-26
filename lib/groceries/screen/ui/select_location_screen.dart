import 'package:flutter/material.dart';
import 'package:online_groceries/groceries/screen/ui/log_in_screen.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  String? selectedZone;
  String? selectedArea;

  final List<String> zones = ['Bhiwani', 'Hisar', 'Pilani', 'Sadulpur'];
  final List<String> areas = ['paju', 'loharu', 'behal', 'rajgarh'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                'https://cdn.icon-icons.com/icons2/159/PNG/256/google_location_maps_22371.png',
                height: 200),
            const SizedBox(height: 16),
            const Text(
              "Select Your Location",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Select your location in your area",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 120),
            DropdownButtonFormField(
              value: selectedZone,
              hint: const Text("Your Zone"),
              items: zones.map((zone) {
                return DropdownMenuItem(
                  value: zone,
                  child: Text(zone),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedZone = value;
                });
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
            const SizedBox(height: 32),
            DropdownButtonFormField(
              value: selectedArea,
              hint: const Text("Your Area"),
              items: areas.map((area) {
                return DropdownMenuItem(
                  value: area,
                  child: Text(area),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedArea = value;
                });
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen(),));
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
              ),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
