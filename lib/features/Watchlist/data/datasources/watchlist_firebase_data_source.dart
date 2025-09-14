import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/features/Watchlist/data/datasources/watchlist_data_source.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/errors/remote/remote_exception.dart';
import '../models/watch_list_model.dart';
import 'local_date_source.dart';

@lazySingleton
class WatchlistFirebaseDataSource implements WatchlistDataSource {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final LocalDateSource _localDateSource = getIt<LocalDateSource>();

  static DocumentReference<WatchlistModel> get myDocument =>
      getWatchlistDocument();

  @override
  Future<void> addToWatchlist(WatchlistMovieModel movie) async {
    try {
      await myDocument
          .update({
            "movies": FieldValue.arrayUnion([movie.toJson()]),
          })
          .timeout(
            const Duration(seconds: 3),
            onTimeout: () => throw RemoteException(message: "Time out"),
          );
    } catch (e) {
      log("Faild to add from the list");

      throw RemoteException(message: "Faild to remove from the list");
    }
  }

  @override
  Future<void> deleteFromWatchlist(WatchlistMovieModel movie) async {
    try {
      await myDocument
          .update({
            "movies": FieldValue.arrayRemove([movie.toJson()]),
          })
          .timeout(
            const Duration(seconds: 3),
            onTimeout: () => throw RemoteException(message: "Time out"),
          );
    } catch (e) {
      log("Faild to remove from the list");
      throw RemoteException(message: "Faild to remove from the list");
    }
  }

  @override
  Future<WatchlistModel> getWatchlist() async {
    DocumentSnapshot<WatchlistModel> snapshot = await myDocument.get();
    return snapshot.data() ?? WatchlistModel(movies: []);
  }

  static DocumentReference<WatchlistModel> getWatchlistDocument() {
    String userId = _localDateSource.getUserId();

    if (userId.isEmpty) {
      DocumentReference<WatchlistModel> doc = getUserCollection().doc()
        ..set(WatchlistModel(movies: []));
      _localDateSource.saveUserId(doc.id);
      return doc;
    }
    return getUserCollection().doc(userId);
  }

  static CollectionReference<WatchlistModel> getUserCollection() => _firestore
      .collection("users")
      .withConverter<WatchlistModel>(
        fromFirestore: (snapshot, _) =>
            WatchlistModel.fromJson(snapshot.data()!),
        toFirestore: (watchlistModel, _) => watchlistModel.toJson(),
      );
}
