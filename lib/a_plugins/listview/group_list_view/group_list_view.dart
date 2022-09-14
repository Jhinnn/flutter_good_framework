import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

import '../../../z_widget/div_scaffold.dart';
import 'app_colors.dart';

Map<String, List> _elements = {
  'Team A': ['Klay Lewis', 'Ehsan Woodard', 'River Bains'],
  'Team B': ['Toyah Downs', 'Tyla Kane'],
  'Team C': ['Marcus Romero', 'Farrah Parkes', 'Fay Lawson', 'Asif Mckay'],
  'Team D': [
    'Casey Zuniga',
    'Ayisha Burn',
    'Josie Hayden',
    'Kenan Walls',
    'Mario Powers'
  ],
  'Team Q': ['Toyah Downs', 'Tyla Kane', 'Toyah Downs'],
};

class GroupListViewDemo extends StatelessWidget {
  const GroupListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return LRScaffold(
        title: 'Group List View Demo',
        child: GroupListView(
          sectionsCount: _elements.keys.toList().length,
          countOfItemInSection: (int section) {
            return _elements.values.toList()[section].length;
          },
          itemBuilder: _itemBuilder,
          groupHeaderBuilder: (BuildContext context, int section) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                _elements.keys.toList()[section],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          sectionSeparatorBuilder: (context, section) => const SizedBox(height: 10),
        ),
      
    );
  }

  Widget _itemBuilder(BuildContext context, IndexPath index) {
    String user = _elements.values.toList()[index.section][index.index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 8,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10.0),
          leading: CircleAvatar(
            backgroundColor: _getAvatarColor(user),
            child: Text(
              _getInitials(user),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          title: Text(
            _elements.values.toList()[index.section][index.index],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  String _getInitials(String user) {
    var buffer = StringBuffer();
    var split = user.split(" ");
    for (var s in split) buffer.write(s[0]);

    return buffer.toString().substring(0, split.length);
  }

  Color _getAvatarColor(String user) {
    return AppColors
        .avatarColors[user.hashCode % AppColors.avatarColors.length];
  }
}
