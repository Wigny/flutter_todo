import 'package:flutter_todo/app/modules/home/components/todo_component.dart';
import 'package:flutter_todo/app/modules/home/home_controller.dart';
import 'package:flutter_todo/app/modules/home/models/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (controller.todoList.hasError) {
            return Center(
              child: RaisedButton(
                onPressed: controller.getList,
                child: Text("Error"),
              ),
            );
          }

          if (controller.todoList.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<TodoModel> list = controller.todoList.data;

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, index) => TodoComponent(
              model: list[index],
              onTap: () => _showDialog(list[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  void _showDialog([TodoModel model]) {
    model ??= TodoModel();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("TODO"),
        content: TextFormField(
          initialValue: model.title,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          onChanged: (v) => model.title = v,
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () async {
              await controller.save(model);
              Modular.to.pop();
            },
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }
}
