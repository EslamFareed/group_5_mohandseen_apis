import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:group_5_mohandseen_apis/models/post_model.dart';
import 'package:group_5_mohandseen_apis/screens/home_screen.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new post"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                labelText: "Body",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                PostModel newPost = PostModel(
                    userId: 1,
                    title: titleController.text,
                    body: bodyController.text);

                Dio dio = Dio();
                try {
                  var response = await dio.post(
                      "https://jsonplaceholder.typicode.com/posts",
                      data: newPost.toJson());

                  if (response.statusCode == 201) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Post created successfully")));

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeSceen(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Error in creating new post please try again")));
                  }
                } catch (e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content:
                          Text("Error in creating new post please try again")));
                }
              },
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
