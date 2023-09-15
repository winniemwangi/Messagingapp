import 'package:messaging_app/features/posts/data/models/post_model.dart';

abstract class PostDomainRepository {
  ///CRUD Opereation bridge
  Future<List<Post>> readPosts();
  Future<Post> getPostById();
  Future<bool> deletePost(int postId);
  Future<Post> createPost(Post post);
  Future<bool> updatePost(int postId);
}
