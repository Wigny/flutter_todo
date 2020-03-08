// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeBase, Store {
  final _$todoListAtom = Atom(name: '_HomeBase.todoList');

  @override
  ObservableStream<List<TodoModel>> get todoList {
    _$todoListAtom.context.enforceReadPolicy(_$todoListAtom);
    _$todoListAtom.reportObserved();
    return super.todoList;
  }

  @override
  set todoList(ObservableStream<List<TodoModel>> value) {
    _$todoListAtom.context.conditionallyRunInAction(() {
      super.todoList = value;
      _$todoListAtom.reportChanged();
    }, _$todoListAtom, name: '${_$todoListAtom.name}_set');
  }

  final _$_HomeBaseActionController = ActionController(name: '_HomeBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_HomeBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'todoList: ${todoList.toString()}';
    return '{$string}';
  }
}
