import 'package:messaging_app/features/posts/domain/repositories/post_repository.dart';

abstract class CreateUseCase<Post> {
  Future<Post> execute(post);
}

class CreateActualRepository implements CreateUseCase {
  CreateActualRepository({required this.repository});

  final PostDomainRepository repository;
  
  @override
  Future execute(post) {

    return repository.createPost(post);
  }

  
}
