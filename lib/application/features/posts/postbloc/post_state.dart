part of 'post_bloc.dart';

@immutable
sealed class PostState extends Equatable{
  @override
  List<Object?> get props => [];
}

final class PostInitial extends PostState {}

class PostStateLoading extends PostState{}

class PostStateLoaded extends PostState{

  final List<PostEntity> posts;

  PostStateLoaded({required this.posts});

  @override
  List<Object?> get props=>[];
}

class PostStateError extends PostState{
  final String msg;

  PostStateError({required this.msg});
  @override
  List<Object?> get props=>[];

}


