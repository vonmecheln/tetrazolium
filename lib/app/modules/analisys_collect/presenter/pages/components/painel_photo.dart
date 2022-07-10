import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';
import 'package:tetrazolium/app/shared/domain/entities/photo_entity.dart';

class PainelPhoto extends StatelessWidget {
  bool reanalise;
  final List<PhotoEntity> photos;
  final void Function(PhotoEntity photo)? onChange;

  PainelPhoto({
    required this.photos,
    Key? key,
    this.onChange,
    this.reanalise = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      FotoWidget(
        reanalise: this.reanalise,
        color: FlutterFlowTheme.primaryColor,
        nome: 'Externa',
        onSave: (url) => onChangePhoto(url, PhotoType.external),
        photos: photos
            .where(
              (p) => p.type == PhotoType.external,
            )
            .toList(),
      ),
      SizedBox(height: 10, width: 10),
      FotoWidget(
        reanalise: this.reanalise,
        color: FlutterFlowTheme.primaryColor,
        nome: 'Interna',
        onSave: (url) => onChangePhoto(url, PhotoType.internal),
        photos: photos
            .where(
              (p) => p.type == PhotoType.internal,
            )
            .toList(),
      ),
    ];

    return Container(
      color: const Color(0xFFF2F2F2),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: this.reanalise
            ? Column(
                children: children,
              )
            : Row(
                children: children,
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
  bool reanalise;
  final Color color;
  final String nome;
  final List<PhotoEntity> photos;
  final Function(String url) onSave;

  FotoWidget({
    Key? key,
    required this.color,
    required this.nome,
    required this.onSave,
    required this.photos,
    this.reanalise = false,
  }) : super(key: key);

  @override
  State<FotoWidget> createState() => _FotoWidgetState();
}

class _FotoWidgetState extends State<FotoWidget> {
  File? _image;
  final _picker = ImagePicker();
  bool _stateUpload = false;

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      // setState(() {
      //   _image = File(pickedImage.path);
      // });

      _image = File(pickedImage.path);

      if (_image != null) {
        setState(() {
          _stateUpload = true;
        });
        var task = FirebaseStorage.instance
            .ref()
            .child(DateTime.now().millisecondsSinceEpoch.toString())
            .putFile(_image ?? File(pickedImage.path));

        task.whenComplete(() async {
          var url = await task.snapshot.ref.getDownloadURL();
          widget.onSave(url);
          setState(() {
            _stateUpload = false;
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_stateUpload);

    Widget? img = widget.photos.isEmpty
        ? null
        : CachedNetworkImage(
            imageUrl: widget.photos.first.name,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) {
              // print(error);
              return Icon(Icons.error);
            },
          );

    return Expanded(
      child: InkWell(
        child: Container(
          color: widget.color,
          alignment: Alignment.center,
          width: double.infinity,
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: Container(
              color: widget.color,
              child: Center(
                child: _stateUpload
                    ? CircularProgressIndicator()
                    : _image != null
                        ? Image.file(_image!, fit: BoxFit.cover)
                        : img != null
                            ? img
                            : widget.reanalise
                                ? Container()
                                : ElevatedButton(
                                    child: Text(widget.nome),
                                    onPressed: _openImagePicker,
                                  ),
              ),
            ),
          ),
        ),
        onTap: widget.reanalise ? null : _openImagePicker,
      ),
    );
  }
}
