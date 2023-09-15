
import 'package:messaging_app/features/posts/data/models/post_model.dart';
import 'package:messaging_app/features/posts/domain/repositories/post_repository.dart';

class ShowPostUseCases {
  ShowPostUseCases({required PostDomainRepository repository})
      : _repository = repository;
  final PostDomainRepository _repository;

  Future<Post> execute(Post post) async {
       return await _repository.createPost(post);
  }

  
}
