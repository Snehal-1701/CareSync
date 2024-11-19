
class MedicalStoresModel{
  String title;
  String address;
  String image;
  String phoneNo;

  MedicalStoresModel({required this.title, required this.address, required this.image, required this.phoneNo});

  Map<String, dynamic> toMap() {
    return {
      'title':title,
      'address':address,
      'phoneNo':phoneNo,
      'image':image,
    };
  }
}

