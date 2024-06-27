import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:postblocapp/domain/entities/post_entity.dart';
import 'package:postblocapp/domain/usecases/post_usecase.dart';
import 'package:postblocapp/sample.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestedEvent>((event, emit) async{
      print("bloc initialized");

      try{
        final post=await PostUsecases().getPostFromDataSource();

        emit(PostStateLoaded(posts: post));
      }
      catch(e){
        emit(PostStateError(msg: e.toString()));
      }

    });
  }
}
