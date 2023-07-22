import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController= TextEditingController();
    TextEditingController titleController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.blueAccent.shade700,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.black87),
                          ),
                          labelText: "Title",
                          hintText: "Enter Title",
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.normal),
                          labelStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: descriptionController,
                        keyboardType: TextInputType.text,
                        minLines: 1,
                        maxLength: 250,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Colors.black87),
                          ),
                          labelText: "Description",
                          hintText: "Enter Description",
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.normal),
                          labelStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
              ),
              const SizedBox(
                height: 30,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

