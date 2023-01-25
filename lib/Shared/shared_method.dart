part of 'shared.dart';

Future<File?> getImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    
    File? file = File(image?.path ?? "");
    return file;
}

Future<String> uploadImage(File image) async {
    String fileName = basename(image.path);
    
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    Task task = reference.putFile(image);
    TaskSnapshot taskSnapshot = await task;
    
    return await taskSnapshot.ref.getDownloadURL();
}