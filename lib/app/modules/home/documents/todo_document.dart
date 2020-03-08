const String query = '''
query getTodos {
  todos {
    id
    title
    check
    date
  }
}
''';

const String subscription = '''
subscription getTodos {
  todos {
    id
    title
    check
    date
  }
}
''';

const String insert = '''
mutation insertTodo(\$title: String!) {
  insert_todos(objects: {title:\$title}) {
    returning {
      id
    }
  }
}
''';

const String update = '''
mutation updateTodo(\$id: Int!, \$title: String, \$check: Boolean) {
  update_todos(where: {id: {_eq: \$id}}, _set: {check: \$check, title: \$title}) {
    affected_rows
  }
}
''';
