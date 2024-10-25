import 'package:flutter/material.dart';
import 'package:flutter_bloc_mitch/counter_bloc/counter_screen.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_bloc_mitch/counter/counter_page.dart';
import 'package:flutter_bloc_mitch/data/models/isar_todo.dart';
import 'package:flutter_bloc_mitch/data/repository/isar_todo_repo.dart';
import 'package:flutter_bloc_mitch/domain/repository/todo_repo.dart';
import 'package:flutter_bloc_mitch/presentation/todo_page.dart';

Stream<int> counterStream() async* {
  int i = 0;
  while (true) {
    await Future.delayed(const Duration(seconds: 1));
    yield i++;
  }
}

Stream<int> numberStream() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}


void main() async {
  /* counterStream().listen((event) {
    print(event);
  }); */

  //numberStream().listen((arg) => print('current number is $arg'));

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
      // Cubic:
      //home: CounterPage(),
      // Cubic Clean Architecture:
      home: TodoPage(todoRepo: todoRepo),
      // BLoC:
      //home: CounterScreen(),

    );
  }
}