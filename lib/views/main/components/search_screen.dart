// flutter
import 'package:flutter/material.dart';
// constants
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
// packages

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    required this.onQueryChanged,
    required this.child,
  });

  final void Function(String)? onQueryChanged;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      onQueryChanged: onQueryChanged,
      clearQueryOnClose: true,
      body: IndexedStack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 56.0),
            child: FloatingSearchBarScrollNotifier(
              child: child,
            ),
          ),
        ],
      ),
      builder: (context, transition) {
        return Container();
      },
    );
  }
}