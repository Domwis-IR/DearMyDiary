import 'package:flutter/material.dart';
import 'Analysis_Today.dart';
import 'package:date_format/date_format.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue.shade900,
        ),
      ),
      home: mainscreens(title: 'Dear My Diary'),
    );
  }
}

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  // Create a global key that uniquely identifies the Form widget and allows validation of the form.
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String _title = '';
  String _detail = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      formatDate(DateTime.now(), ['20',yy, '-', M, '-', d]),
                      style: const TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.auto_awesome_outlined),
                          hintText: 'How is Today',
                          labelText: 'Title',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              )
                          )
                      ),
                      onSaved: (value) {
                        setState(() {
                          _title = value as String;
                        });
                      },
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: 17,
                      autovalidateMode: AutovalidateMode.always,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.article),
                          hintText: 'Tell me your day',
                          labelText: 'Today Diary',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              )
                          )
                      ),
                      onSaved: (value) {
                        setState(() {
                          _detail = value as String;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("오늘의 일기작성 완료!")),
                          );
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainRoute())
                        );
                      },
                      child: const Text('End of Diary'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue.shade900,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
