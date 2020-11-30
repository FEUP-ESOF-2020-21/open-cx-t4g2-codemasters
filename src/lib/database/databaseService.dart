import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ESOF/model/userModel.dart';

class DatabaseService {
  static final dbReference = FirebaseFirestore.instance;

  static Future<UserModel> getUser(String uid) async {
    Query query = dbReference.collection('Users').where('uid', isEqualTo: uid);

    QuerySnapshot user = await query.get();

    Map<String, dynamic> userData = user.docs[0].data();
    print(user.docs[0].reference);
    print(user.docs[0].data());
    print(user.docs[0].id);
    UserModel userM = UserModel(data: userData, ref: user.docs[0].id);

    return userM;
  }

  static Future updateUser(
      String ref, String username, String description, String imagePath) async {
    await dbReference.collection('Users').doc(ref).update({
      'username': username,
      'description': description,
      'imgPath': imagePath
    });
  }

  static Future updateRating(
      String uid, DocumentReference confReference, double rating) async {
    UserModel currentUser = await getUser(uid);
    print(currentUser.ref);
    Query ratingQuery = dbReference.collection('UserRating_Conference');
    ratingQuery = ratingQuery.where('user', isEqualTo: currentUser.ref);
    ratingQuery = ratingQuery.where('conference', isEqualTo: confReference);
    ratingQuery.get().then((ratingRef) async {
      if (ratingRef.docs.length == 0) {
        // Rating inexistente, inserir um
        await dbReference.collection('UserRating_Conference').add({
          'conference': confReference,
          'user': currentUser.ref,
          'rating': rating
        });
      } else {
        // Atualizar rating
        await dbReference
            .collection('UserRating_Conference')
            .doc(ratingRef.docs[0].id)
            .update({'rating': rating});
      }
    });
  }
}
