

import 'package:flutter/material.dart';
import 'package:dental_minor/widgets/widgets.dart';
import 'package:dental_minor/model/faqsData.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppbar(
        title: 'FAQs Page',
      ),
      body: ListView.builder(
        itemCount: FaqsData.questionAns.length,
        itemBuilder: (context, index) {
          final question = FaqsData.questionAns[index]["Question"] as String?;
          final answer = FaqsData.questionAns[index]["Answer"] as String?;

          if (question == null || answer == null) {
            return SizedBox(); // Return an empty container if the data is null
          }

          return ExpansionTile(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                question,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black),
              ),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(answer, style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.grey[700]),),
              ),
            ],
          );
        },
      ),
    );
  }
}
