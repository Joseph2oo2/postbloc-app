import 'package:postblocapp/data/datasources/post_remote_datasource.dart';
import 'package:postblocapp/domain/entities/post_entity.dart';
import 'package:postblocapp/domain/repositories/post_repository.dart';

class PostRepoImpl implements PostRepo {
  PostRemoteDataSource postRemoteDataSource = PostRemoteDataSourceImpl();
  @override
  Future<List<PostEntity>> getPostFromDataSource() async {
    final post = await postRemoteDataSource.getPostFromApi();
    return post;
  }
}
