import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/app/modules/home/home_controller.dart';
import 'package:flutter_todo/app/modules/home/repositories/todo_repository.dart';
import 'package:flutter_todo/app/modules/home/repositories/todo_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_todo/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => HomeController(
            i.get(),
          ),
        ),
        Bind<ITodoRepository>(
          (i) => TodoRepository(
            Firestore.instance,
          ),
        ),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
