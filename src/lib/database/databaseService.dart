import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ESOF/model/userModel.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  static final dbReference = FirebaseFirestore.instance;

  static Future<UserModel> getUser(String uid) async {
    Query query = dbReference.collection('Users').where('uid', isEqualTo: uid);

    QuerySnapshot user = await query.get();

    Map<String, dynamic> userData = user.docs[0].data();

    UserModel userM = UserModel(data: userData, ref: user.docs[0].reference);

    return userM;
  }

  static Future updateUser(DocumentReference ref, String username,
      String description, String imagePath) async {
    await ref.update({
      'username': username,
      'description': description,
      'imgPath': imagePath
    });
  }

  static Future updateConfRating(DocumentReference confReference) async {
    double confRatingSum = 0.0;
    int numRatings;
    await dbReference
        .collection('UserRating_Conference')
        .where('conference', isEqualTo: confReference)
        .get()
        .then((userRatings) {
      numRatings = userRatings.docs.length;
      userRatings.docs.forEach((userRating) {
        confRatingSum += userRating['rating'];
      });
    });

    double averageRatingConf = confRatingSum / numRatings;
    // print(averageRatingConf);

    confReference.update({'rate': averageRatingConf});
  }

  static Future updateUserRating(
      String uid, DocumentReference confReference, double rating) async {
    UserModel currentUser = await getUser(uid);
    print(currentUser);
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

      await updateConfRating(confReference);
    });
  }

  static Future leaveConfComment(
      String uid, DocumentReference confReference, String comment) async {
    UserModel currentUser = await getUser(uid);
    DateTime now = DateTime.now();
    dbReference.collection('Comments').add({
      'conference': confReference,
      'user': currentUser.ref,
      'text': comment,
      'date': now
    });
  }

  static Future<List<Map<String, dynamic>>> getConferenceComments(
      DocumentReference confReference) async {
    List<Map<String, dynamic>> commentsInfo = [];

    String username, date, commentText;
    num rating;

    await dbReference
        .collection('Comments')
        .where('conference', isEqualTo: confReference)
        .get()
        .then((confcomments) async {
      for (int i = 0; i < confcomments.docs.length; i++) {
        await confcomments.docs[i]['user'].get().then((user) {
          username = user['username'];
        });

        Query ratingQuery = dbReference.collection('UserRating_Conference');
        ratingQuery =
            ratingQuery.where('user', isEqualTo: confcomments.docs[i]['user']);
        ratingQuery = ratingQuery.where('conference', isEqualTo: confReference);
        await ratingQuery.get().then((userRating) {
          rating = userRating.docs[0]['rating'];
        });

        DateTime confTime = DateTime.fromMillisecondsSinceEpoch(
            confcomments.docs[i]['date'].seconds * 1000);
        String formattedDate =
            DateFormat('yyyy-MM-dd - HH:mm:ss').format(confTime);

        commentsInfo.add({
          'user': username,
          'rating': rating.toInt(),
          'date': formattedDate,
          'comment': confcomments.docs[i]['text']
        });
      }
    });
    // print(commentsInfo);
    return commentsInfo;
  }
}
