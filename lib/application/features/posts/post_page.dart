import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postblocapp/application/core/services/theme_service.dart';
import 'package:postblocapp/application/features/posts/postbloc/post_bloc.dart';
import 'package:provider/provider.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>PostBloc(),child: PostPage(),);
  }
}


class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "PostApp Using Bloc",
          style: themeData.textTheme.titleMedium,
        ),
        actions: [
          Switch(
            activeColor: Colors.green,
              inactiveTrackColor: Colors.blueGrey,
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
              onChanged: (_) {
                Provider.of<ThemeServiceProvider>(context,listen: false).toggleTheme();
              }),

          IconButton(onPressed: (){
           BlocProvider.of<PostBloc>(context).add(PostRequestedEvent());
          }, icon: Icon(Icons.refresh)
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child:Column(
          mainAxisAlignment:MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
            Text("All Post",style:themeData.textTheme.displayLarge),
            const SizedBox(height: 20,),


           Expanded(
               child:BlocBuilder<PostBloc,PostState>(
                 builder: (context,state){
                   if(state is PostInitial){
                     return const Text("Your post is waiting to be loaded");
                   }
                  else if(state is PostStateLoading){
                     return Center(
                       child: const CircularProgressIndicator(
                         color:Colors.pink,
                       ),
                     );
                   }
                   else if(state is PostStateLoaded){
                     return ListView.builder(
                         itemCount: state.posts.length,
                         itemBuilder: (context,index)
                         {
                           return  Card(
                             child: ListTile(
                               leading: CircleAvatar(
                                 child: Center(
                                   child: Text("${index+1}"),
                                 ),
                               ),
                               title: Text("${state.posts[index].title}"),
                               subtitle: Text("${state.posts[index].body}"),

                             ),
                           ) ;
                         });
                   }
                   else if(state is PostStateError){
                     return Center(child: Text(state.msg));
                   }

                   return Center(child: Text("Some Error Occured"));
                 },
               )
           )

           
          ]
        )
      ),
    );
  }
}
