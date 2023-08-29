import 'package:flutter/material.dart';
import 'package:app/models/scope.dart';
import 'package:app/view/oss_detail_view.dart';
import 'package:app/resources/dismissible_view.dart';
import 'package:app/oss_licenses.dart';
import 'package:app/resources/item.dart';
import 'package:app/resources/exitable.dart';
import 'package:app/resources/page_route_builder.dart';

class OSSView extends StatelessWidget {
  const OSSView({super.key});

  @override
  Widget build(BuildContext context) {
    return DismissibleView(
      onDismissed: () {
        ExitScope.remove = ExitScope.ossLicense;
        Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("오픈소스 라이선스"),
        ),
        backgroundColor: Colors.white,
        body: Exitable(
          scopes: const [ExitScope.ossLicense],
          onExitable: (scope) {
            if (scope == ExitScope.ossLicense) {
              ExitScope.remove = ExitScope.ossLicense;
              Navigator.pop(context);
            }
          },
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: ossLicenses.length,
              itemBuilder: (context, idx) {
                Package package = ossLicenses[idx];
                return Item(
                  onTap: () => Navigator.push(
                    context,
                    pageRouteBuilder(
                      page: OSSDetailView(
                        name: package.name,
                        license: package.license ?? '',
                      ),
                      scope: ExitScope.ossDetail,
                    ),
                  ),
                  text: package.name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
