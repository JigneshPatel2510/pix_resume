import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pix_resume/add_details.dart';
import 'package:widget_zoom/widget_zoom.dart';

class TemplateViewer extends StatefulWidget {
  final dynamic template;


  const TemplateViewer({super.key, this.template});

  @override
  State<TemplateViewer> createState() => _TemplateViewerState();
}

class _TemplateViewerState extends State<TemplateViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: WidgetZoom(
                  fullScreenDoubleTapZoomScale: 1,
                    heroAnimationTag: '',
                    zoomWidget: Image.network(widget.template['preview'])))

            // Center(child: Image.network(widget.template['preview'])),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: 90,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: () {
            Get.to(const AddDetails());
          },
          child: Material(
            borderRadius: BorderRadius.circular(30),
            child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0xff0D74FF),
                    borderRadius: BorderRadius.circular(30)),
                child: const Center(
                    child: Text("Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900)))),
          ),
        ),
      ),
    );
  }
}
