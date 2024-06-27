part of 'post_bloc.dart';

@immutable
sealed class PostEvent extends Equatable {


}

class PostRequestedEvent extends PostEvent{
  @override
  List<Object?> get props=>[];
}
