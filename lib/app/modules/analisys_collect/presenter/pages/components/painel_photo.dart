import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';
import 'package:tetrazolium/app/shared/domain/entities/photo_entity.dart';

class PainelPhoto extends StatelessWidget {
  final void Function(PhotoEntity photo)? onChange;

  const PainelPhoto({
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F2F2),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            FotoWidget(
              color: FlutterFlowTheme.primaryColor,
              nome: 'Externa',
              onSave: (url) => onChangePhoto(url, PhotoType.external),
            ),
            SizedBox(height: 10, width: 10),
            FotoWidget(
              color: FlutterFlowTheme.primaryColor,
              nome: 'Interna',
              onSave: (url) => onChangePhoto(url, PhotoType.internal),
            ),
          ],
        ),
      ),
    );
  }

  onChangePhoto(String url, PhotoType type) {
    final photo = PhotoEntity(name: url, type: type);
    if (onChange != null) onChange!(photo);
  }
}

class FotoWidget extends StatefulWidget {
  final Color color;
  final String nome;
  final Function(String url) onSave;

  const FotoWidget({
    Key? key,
    required this.color,
    required this.nome,
    required this.onSave,
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
      // setState(() {
      //   _image = File(pickedImage.path);
      // });

      _image = File(pickedImage.path);

      if (_image != null) {
        var task = FirebaseStorage.instance
            .ref()
            .child(DateTime.now().millisecondsSinceEpoch.toString())
            .putFile(_image ?? File(pickedImage.path));

        task.whenComplete(() async {
          var url = await task.snapshot.ref.getDownloadURL();
          widget.onSave(url);
          setState(() {});
        });
      }
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
            color: widget.color,
            child: Center(
              child: _image != null
                  ? Image.file(_image!, fit: BoxFit.cover)
                  : ElevatedButton(
                      child: Text(widget.nome),
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
