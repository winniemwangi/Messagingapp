import 'package:messaging_app/features/posts/domain/repositories/post_repository.dart';

class UpdatePostUseCases {
  UpdatePostUseCases({required PostDomainRepository repository})
      : _repository = repository;
  final PostDomainRepository _repository;

  Future<bool> call(int id) => _repository.updatePost(id);
}
