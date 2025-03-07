// flutter
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonanceep_sns/constants/search_tab_bar_elements.dart';
import 'package:sonanceep_sns/constants/strings.dart';
// constants
import 'package:sonanceep_sns/models/main_model.dart';
import 'package:sonanceep_sns/models/main/passive_user_profile_model.dart';
import 'package:sonanceep_sns/views/main/components/user_search_screen.dart';
import 'package:sonanceep_sns/views/main/components/post_search_screen.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({
    super.key,
    required this.mainModel,
  });

  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PassiveUserProfileModel passiveUserProfileModel = ref.watch(passiveUserProfileProvider);

    return DefaultTabController(
      length: searchTabBarElements.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(searchScreenTitle),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: searchTabBarElements.map((e) => Tab(text: e.title,)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            UserSearchScreen(mainModel: mainModel, passiveUserProfileModel: passiveUserProfileModel),
            PostSearchScreen(mainModel: mainModel),
          ],
        ),
      ),
    );
  }
}