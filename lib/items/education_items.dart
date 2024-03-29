import 'package:flutter/material.dart';

class EducationItems extends StatelessWidget {
  final dynamic data;
  final int index;
  const EducationItems({super.key, this.data, required this.index});

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
                const Text("Degree Name : "),
                const Spacer(),
                Text(data['degree_name']),
              ],
            ),
            Row(
              children: [
                const Text("Institute Name : "),
                const Spacer(),
                Text(data['institute_name']),
              ],
            ),
            Row(
              children: [
                const Text("Institute Address : "),
                const Spacer(),
                Text(data['institute_address']),
              ],
            ),
            Row(
              children: [
                const Text("Degree Year : "),
                const Spacer(),
                Text(data['degree_year']),
              ],
            ),
            Row(
              children: [
                const Text("Description : "),
                const Spacer(),
                Flexible(child: Text(data['description']),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
