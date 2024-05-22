import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:group_5_mohandseen_apis/models/post_model.dart';
import 'package:group_5_mohandseen_apis/screens/create_post_screen.dart';

class HomeSceen extends StatefulWidget {
  const HomeSceen({super.key});

  @override
  State<HomeSceen> createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  // List<Map<String, dynamic>> posts = [];

  List<PostModel> posts = [];

  bool isLoading = true;

  _getData() async {
    Dio dio = Dio();
    var response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      var data = response.data as List;

      posts = data.map((e) => PostModel.fromJson(e)).toList();

      // for (var element in data) {
      //   posts.add(PostModel.fromJson(element));
      // }

      setState(() {
        isLoading = false;
      });
    } else {
      print("error");
    }
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CreatePostScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text(posts[index].id.toString()),
                    ),
                    title: Text(posts[index].title!),
                    subtitle: Text(posts[index].body!),
                  ),
                );
              },
              itemCount: posts.length,
            ),
    );
  }
}
