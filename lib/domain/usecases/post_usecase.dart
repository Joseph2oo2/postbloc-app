import 'package:flutter/cupertino.dart';
import 'package:postblocapp/data/repositories/post_repo_impl.dart';
import 'package:postblocapp/domain/entities/post_entity.dart';
import 'package:postblocapp/sample.dart';

import '../repositories/post_repository.dart';

class PostUsecases{

  PostRepo postRepo=PostRepoImpl();
  Future<List<PostEntity>> getPostFromDataSource() async{
    final post= await postRepo.getPostFromDataSource();
    return post;
  }

}