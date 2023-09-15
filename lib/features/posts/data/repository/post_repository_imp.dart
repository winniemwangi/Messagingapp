import 'package:messaging_app/features/posts/data/data_source.dart/remote_data_source.dart';
import 'package:messaging_app/features/posts/data/models/post_model.dart';
import 'package:messaging_app/features/posts/domain/entities/post_entity.dart';
import 'package:messaging_app/features/posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostDomainRepository {
  final RemoteDataSource remoteDataSource;
  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Post> createPost(Post postDomainEntity) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePost(int postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Post> getPostById() {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> readPosts() {
    return remoteDataSource.getPosts();
  }

  @override
  Future<bool> updatePost(int postId) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
