//importing dart files
import 'dart:html' hide Platform;
import 'dart:io' show Platform;

//importing packages
import 'package:flutter/foundation.dart' show kIsWeb;

class ImageFromClient {
  static getImage({required Function onComplete}) {
    if (kIsWeb) {
      //client is using web
      getImageForWeb(onComplete: onComplete);
      // final File img = await getImageForWeb();
    } else if (Platform.isAndroid || Platform.isIOS) {
      // client is using Mobile
    } else if (Platform.isWindows) {
      // cleint is in Dekstop
    }
  }

  static void getImageForWeb({required Function onComplete}) {
    InputElement uploadInput = (FileUploadInputElement() as InputElement)
      ..accept = 'image/*'
      ..multiple = false;

    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final File file = uploadInput.files!.first;

      final reader = FileReader();
      reader.readAsArrayBuffer(file);
      reader.onLoadEnd.listen((event) {
        onComplete(reader.result);
      });
    });

    // final completer = new Completer<String>();
    // final InputElement input = document.createElement('input') as InputElement;
    // input
    //   ..type = 'file'
    //   ..accept = 'image/*';
    // input.onChange.listen((e) async {
    //   final List<File> files = input.files!;
    //   final reader = new FileReader();
    //   reader.readAsDataUrl(files[0]);
    //   reader.onError.listen((error) => completer.completeError(error));
    //   await reader.onLoad.first;
    //   completer.complete(reader.result as String);
    // });
    // input.click();
    // return completer.future;
  }
}
