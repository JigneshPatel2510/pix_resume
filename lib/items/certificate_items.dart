import 'package:flutter/material.dart';

class CertificateItems extends StatelessWidget {
  final dynamic data;
  final int index;
  const CertificateItems({super.key, this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:Border.all(
              color: Colors.grey.shade300
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Name Of Certificate : "),
                const Spacer(),
                Text(data['name_of_certificate']),
              ],
            ),
            Row(
              children: [
                const Text("Academy Name : "),
                const Spacer(),
                Text(data['academy_name']),
              ],
            ),
            Row(
              children: [
                const Text("Academy Address : "),
                const Spacer(),
                Text(data['academy_address']),
              ],
            ),
            Row(
              children: [
                const Text("Certificate Year : "),
                const Spacer(),
                Text(data['certificate_year']),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
