import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_bloc_mitch/counter/counter_page.dart';
import 'package:flutter_bloc_mitch/data/models/isar_todo.dart';
import 'package:flutter_bloc_mitch/data/repository/isar_todo_repo.dart';
import 'package:flutter_bloc_mitch/domain/repository/todo_repo.dart';
import 'package:flutter_bloc_mitch/presentation/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // get directory path for storing data
  final dir = await getApplicationDocumentsDirectory();

  // open isar database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  // initialize the repo with isar database
  final isarTodoRepo = IsarTodoRepo(isar);

  // run app
  runApp(MyApp(todoRepo: isarTodoRepo));
}

class MyApp extends StatelessWidget {
  // database injection through the app
  final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: CounterPage(),
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}