import 'package:messaging_app/features/posts/data/models/post_model.dart';
import 'package:messaging_app/features/posts/domain/repositories/post_repository.dart';
                                                                                                                                                                                        
abstract class FetchUseCase<T> {
  Future<T> execute();
}

class FetchActualRepository implements FetchUseCase<List<Post>> {
FetchActualRepository({ required this.repository});

  final PostDomainRepository repository;
  
  @override
  Future<List<Post>> execute() {
    return repository.readPosts();
  }
  

  
}