import 'package:flutter/material.dart';
import 'package:getmoney/database/person.dart';
import 'package:getmoney/main/main_notifier.dart';
import 'package:getmoney/my_app.dart';
import 'package:getmoney/ui/main_user_widget.dart';
import 'package:getmoney/utils/utils.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainNotifier>(
      create: (context) {
        return MainNotifier(database: context.database)..loadData();
      },
      builder: (context, child) {
        final viewModel = context.read<MainNotifier>();
        final persons =
            context.select((MainNotifier value) => value.persons) ?? [];

        print(persons.toString());

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Get"),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: persons.length,
                    itemBuilder: (context, index) {
                      final person = persons[index];
                      return UserWidget(
                        person: person,
                        callback: (person) {
                          viewModel.updatePerson(person: person);
                        },
                        onDelete: (person) {
                          viewModel.deletePersonById(id: person.id ?? -1);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final userName = await context.showAddUserDialog();

              if (userName != null) {
                viewModel.addPerson(person: Person(name: userName));
              }
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
