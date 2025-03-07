import 'package:flutter/material.dart';

class ReportContentsListView extends StatelessWidget {
  const ReportContentsListView({
    super.key,
    required this.selectedReportContentsNotifier,
  });

  final ValueNotifier<List<String>> selectedReportContentsNotifier;

  @override
  Widget build(BuildContext context) {
    const List<String> reportContents = ['暴力的なコンテンツ', '性的なコンテンツ', '不快なコンテンツ'];
    // dialogで表示するので高さが必要
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.7,
      // valueNotifierの変更を検知
      child: ValueListenableBuilder<List<String>>(
        valueListenable: selectedReportContentsNotifier,
        builder: (_, selectedReportContents, __) {  // selectedReportContentsは変更が検知される
          return ListView.builder(
            itemCount: reportContents.length,
            itemBuilder: (context, index) {
              final String reportContent = reportContents[index];
              return ListTile(
                leading: selectedReportContents.contains(reportContent) ? const Icon(Icons.check, color: Colors.green,) : const SizedBox.shrink(),
                title: Text(reportContent),
                onTap: () {
                  if(!selectedReportContentsNotifier.value.contains(reportContent)) {
                    List<String> x = selectedReportContentsNotifier.value;
                    x.add(reportContent);
                    selectedReportContentsNotifier.value = x.map((e) => e).toList();  // valueの中身を上書きしている
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}