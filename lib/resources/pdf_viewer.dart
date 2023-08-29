import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFScreen extends StatefulWidget {
  final String? path;

  const PDFScreen({Key? key, this.path}) : super(key: key);

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller = Completer<
      PDFViewController>(); // Controller to interact with the PDF view
  int? pages = 0; // Total number of pages in the PDF document
  int? currentPage = 0; // Current displayed page
  bool isReady = false; // Indicates whether the PDF is ready to be displayed
  String errorMessage = ''; // Holds error messages if any

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Document"),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PDFView(
            // Display the PDF using Flutter PDFView
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: true,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                true, // Prevent opening links within the PDF in an external browser
            onRender: (pages) {
              setState(() {
                pages = pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container() // Show loading indicator while PDF is rendering
              : Center(
                  child: Text(
                      errorMessage), // Show error message if there's an issue
                )
        ],
      ),
      floatingActionButton: FutureBuilder<PDFViewController>(
        future: _controller.future,
        builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
          if (snapshot.hasData) {
            return FloatingActionButton.extended(
              label: const Text("처음으로 이동"),
              onPressed: () async {
                await snapshot.data!.setPage(pages! ~/ 2);
              },
            ); // Button to navigate to the first page
          }

          return Container();
        },
      ),
    );
  }
}
