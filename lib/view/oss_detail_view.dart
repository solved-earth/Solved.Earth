import 'package:flutter/material.dart';
import 'package:app/models/scope.dart';
import 'package:app/resources/dismissible_view.dart';
import 'package:app/resources/exitable.dart';

class OSSDetailView extends StatelessWidget {
  const OSSDetailView({super.key, required this.name, required this.license});
  final String name, license;

  @override
  Widget build(BuildContext context) {
    return DismissibleView(
      onDismissed: () {
        ExitScope.remove = ExitScope.ossDetail;
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("오픈소스 라이선스"),
        ),
        backgroundColor: Colors.white,
        body: Exitable(
          scopes: const [ExitScope.ossDetail],
          onExitable: (scope) {
            if (scope == ExitScope.ossDetail) {
              ExitScope.remove = ExitScope.ossDetail;
              Navigator.pop(context);
            }
          },
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    // Display the license text with a bold font style
                    child: Text(
                      license,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1024,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
