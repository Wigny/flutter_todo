import 'package:flutter_todo/app/modules/home/home_controller.dart';
import 'package:flutter_todo/app/modules/home/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoComponent extends StatelessWidget {
  final TodoModel model;
  final Function onTap;

  const TodoComponent({Key key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Modular.get<HomeController>();

    return ListTile(
      title: Text(model.title),
      onTap: onTap,
      leading: Checkbox(
        value: model.check,
        onChanged: (bool value) {
          model.check = value;
          controller.save(model);
        },
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () => controller.delete(model),
      ),
    );
  }
}
