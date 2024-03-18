import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getmoney/database/person.dart';
import 'package:getmoney/gen/assets.gen.dart';
import 'package:getmoney/main/main_notifier.dart';
import 'package:getmoney/my_app.dart';
import 'package:getmoney/theme/app_colors.dart';
import 'package:getmoney/ui/ginseng/inkwell_wrapper.dart';
import 'package:getmoney/ui/ginseng/main_user_widget.dart';
import 'package:getmoney/utils/utils.dart';
import 'package:provider/provider.dart';

class GinSengScreen extends StatelessWidget {
  const GinSengScreen({super.key});

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

        final top1Person =
            context.select((MainNotifier value) => value.largestPerson);
        final botPerson =
            context.select((MainNotifier value) => value.smallestPerson);

        print(top1Person);
        return Scaffold(
          backgroundColor: context.adaptiveColor(
              light: AppColors.sffffffff, dark: AppColors.sff333333),
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Get Money"),
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Top 1: ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: context.adaptiveColor(
                            light: AppColors.sff333333,
                            dark: AppColors.sffffffff),
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        top1Person?.name ?? "Unknown",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: AppColors.sff219653,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Low: ",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        color: context.adaptiveColor(
                            light: AppColors.sff333333,
                            dark: AppColors.sffffffff),
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        botPerson?.name ?? "Unknown",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: AppColors.sffeb5757,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                ),
              Expanded(
                child: Column(children: [
                  Flexible(
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
                ],),
              )
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
            child: const Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
