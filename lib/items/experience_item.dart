import 'package:flutter/material.dart';

class ExperienceItem extends StatelessWidget {
  final dynamic data;
  final int index;
  const ExperienceItem({super.key,this.data,required this.index});

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
                const Text("Company Name : "),
                const Spacer(),
                Text(data['company_name']),
              ],
            ),
            Row(
              children: [
                const Text("Company Address : "),
                const Spacer(),
                Text(data['company_address']),
              ],
            ),
            Row(
              children: [
                const Text("Level Of Position : "),
                const Spacer(),
                Text(data['level_of_position']),
              ],
            ),
            Row(
              children: [
                const Text("Year : "),
                const Spacer(),
                Text(data['year']),
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
