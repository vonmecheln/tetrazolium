import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PainelPhoto extends StatelessWidget {
  const PainelPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F2F2),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: const [
            FotoWidget(color: Colors.red),
            SizedBox(height: 10, width: 10),
            FotoWidgetOld(color: Colors.blue),
          ],
        ),
      ),
    );
  }
}

class FotoWidget extends StatefulWidget {
  final Color color;
  const FotoWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  State<FotoWidget> createState() => _FotoWidgetState();
}

class _FotoWidgetState extends State<FotoWidget> {
  File? _image;
  final _picker = ImagePicker();

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: widget.color,
        alignment: Alignment.center,
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: Container(
            color: Colors.green,
            child: Center(
              child: _image != null
                  ? Image.file(_image!, fit: BoxFit.cover)
                  : ElevatedButton(
                      child: const Text('Select An Image'),
                      onPressed: _openImagePicker,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class FotoWidgetOld extends StatelessWidget {
  final Color color;
  const FotoWidgetOld({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: color,
    ));
  }
}
