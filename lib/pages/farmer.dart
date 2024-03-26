import 'package:flutter/material.dart';

class FarmerDetailScreen extends StatefulWidget {
  static const String id = 'farmer';
  const FarmerDetailScreen({super.key});

  @override
  State<FarmerDetailScreen> createState() => _FarmerDetailScreenState();
}

class _FarmerDetailScreenState extends State<FarmerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Farmer Details',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ]),
    );
  }
}
