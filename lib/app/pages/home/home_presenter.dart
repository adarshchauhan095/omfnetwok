// coverage:ignore-file

import 'package:omf_netflix/domain/domain.dart';

/// connect to the controller to retrieve the data .
class HomePresenter {
  HomePresenter(this._authUseCases);
  final AuthUseCases _authUseCases;

  /// Get guesttoken form local
  Future<String?> getSecureValue(String key) =>
      _authUseCases.getSecureValue(key);

  /// Logout API call
  Future<void> logout() async => await _authUseCases.logout();

  /// Profile API
  Future<ProfileResponse?> getProfileData() async =>
      await _authUseCases.getProfileData();


  /// Gget list of collections
  Future<CollectionListResponse?> getCollections({
    required String limit,
    required String offset,
    required bool loading,
  }) async =>
      await _authUseCases.getCollections(
          limit: limit, offset: offset, loading: loading);

            /// API to create a collection
  Future<ResponseModel> createCollection({
   
    required String title,
    required bool loading,
  }) async =>
      await _authUseCases.createCollection(
          title: title, loading: loading);

            /// API to bookmark a post
  Future<ResponseModel> bookmarkPost({
    required String postId,
    required String collectionId,
    required bool loading,
  }) async =>
      await _authUseCases.bookmarkPost(
          postId: postId, collectionId: collectionId, loading: loading);

}
