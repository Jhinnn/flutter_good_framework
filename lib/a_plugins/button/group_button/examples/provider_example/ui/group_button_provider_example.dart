import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../providers/exercises_provider.dart';

const primaryColor = Colors.purple;

class GroupButtonProviderExample extends StatefulWidget {
  const GroupButtonProviderExample({Key? key}) : super(key: key);

  @override
  GroupButtonProviderExampleState createState() =>
      GroupButtonProviderExampleState();
}

class GroupButtonProviderExampleState extends State<GroupButtonProviderExample>
    with SingleTickerProviderStateMixin {
  Axis direction = Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    final _eProvider = Provider.of<ExarcisesProvider>(context);
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _eProvider.exercise.questions.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('GroupButton & Provider'),
          bottom: TabBar(
            onTap: (value) {
              _eProvider.selectedIndex = value;
            },
            tabs: List.generate(
              _eProvider.exercise.questions.length,
              (index) => index + 1,
            ).map((e) => Tab(icon: Text('$e'))).toList(),
          ),
        ),
        body: _buildTabBarView(_eProvider, size),
      ),
    );
  }

  TabBarView _buildTabBarView(ExarcisesProvider eProvider, Size size) {
    return TabBarView(
      children: eProvider.exercise.questions
          .map(
            (q) => Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        q.title,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GroupButton(
                        options: const GroupButtonOptions(
                          spacing: 15,
                          selectedColor: primaryColor,
                        ),
                        isRadio: false,
                        onSelected: (_, index, isSelected) {
                          debugPrint(
                            '$index button is ${isSelected ? 'selected' : 'unselected'}',
                          );
                          eProvider.updateAnswer(index, value: isSelected);
                        },
                        buttons: q.answerTitles,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        final result = eProvider.checkResult();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              result
                                  ? 'Great! correct answer'
                                  : 'Bad answer! Try again',
                            ),
                            backgroundColor: result ? Colors.green : Colors.red,
                          ),
                        );
                      },
                      child: const Text('Check'),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
