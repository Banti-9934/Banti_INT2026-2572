import 'package:flutter/material.dart';
import '../../../models/user_model.dart';

class CertificateTile extends StatelessWidget {
  final UserModel user;   // 👈 ADD THIS

  const CertificateTile({super.key, required this.user});  // 👈 UPDATE

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.school, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.certificateTitle,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text("Completed • ${user.completedDate}",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16)
        ],
      ),
    );
  }
}
