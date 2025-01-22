import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:mangayomi/main.dart';
import 'package:mangayomi/models/manga.dart';
import 'package:mangayomi/models/source.dart';
import 'package:mangayomi/modules/more/settings/reader/providers/reader_state_provider.dart';
import 'package:mangayomi/providers/l10n_providers.dart';
import 'package:mangayomi/modules/browse/extension/extension_screen.dart';
import 'package:mangayomi/modules/library/widgets/search_text_form_field.dart';
import 'package:mangayomi/services/fetch_sources_list.dart';
import 'package:mangayomi/providers/storage_provider.dart';

class BrowseExtensionsScreen extends ConsumerStatefulWidget {
  const BrowseExtensionsScreen({super.key});

  @override
  ConsumerState<BrowseExtensionsScreen> createState() =>
      _BrowseExtensionsScreenState();
}

class _BrowseExtensionsScreenState extends ConsumerState<BrowseExtensionsScreen>
    with TickerProviderStateMixin {
  late TabController _tabBarController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tabBarController = TabController(length: 3, vsync: this);
    _tabBarController.animateTo(0);
    _tabBarController.addListener(() {
      _chekPermission();
      setState(() {
        _textEditingController.clear();
        _isSearch = false;
      });
    });
  }

  _chekPermission() async {
    await StorageProvider().requestPermission();
  }

  final _textEditingController = TextEditingController();
  bool _isSearch = false;

  @override
  Widget build(BuildContext context) {
    final l10n = l10nLocalizations(context)!;
    return DefaultTabController(
      animationDuration: Duration.zero,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            l10n.extensions,
            style: TextStyle(color: Theme.of(context).hintColor),
          ),
          actions: [
            _isSearch
                ? SeachFormTextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSuffixPressed: () {
                      _textEditingController.clear();
                    },
                    onPressed: () {
                      setState(() {
                        _isSearch = false;
                      });
                      _textEditingController.clear();
                    },
                    controller: _textEditingController,
                  )
                : Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            context.push('/createExtension');
                          },
                          icon: Icon(Icons.add_outlined,
                              color: Theme.of(context).hintColor)),
                      IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            setState(() {
                              _isSearch = true;
                            });
                          },
                          icon: Icon(Icons.search_rounded,
                              color: Theme.of(context).hintColor)),
                    ],
                  ),
            IconButton(
                splashRadius: 20,
                onPressed: () {
                  _textEditingController.clear();
                  context.push('/ExtensionLang',
                      extra: switch (_tabBarController.index) {
                        0 => ItemType.manga,
                        1 => ItemType.anime,
                        _ => ItemType.novel,
                      });
                },
                icon: Icon(Icons.translate_rounded,
                    color: Theme.of(context).hintColor)),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            controller: _tabBarController,
            tabs: [
              Tab(
                child: Row(
                  children: [
                    Text(l10n.manga_extensions),
                    const SizedBox(width: 8),
                    _extensionUpdateNumbers(ref, ItemType.manga)
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Text(l10n.anime_extensions),
                    const SizedBox(width: 8),
                    _extensionUpdateNumbers(ref, ItemType.anime)
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Text(l10n.novel_extensions),
                    const SizedBox(width: 8),
                    _extensionUpdateNumbers(ref, ItemType.novel)
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabBarController,
          children: [
            ExtensionScreen(
                query: _textEditingController.text, itemType: ItemType.manga),
            ExtensionScreen(
                query: _textEditingController.text, itemType: ItemType.anime),
            ExtensionScreen(
                query: _textEditingController.text, itemType: ItemType.novel),
          ],
        ),
      ),
    );
  }
}

Widget _extensionUpdateNumbers(WidgetRef ref, ItemType itemType) {
  return StreamBuilder(
      stream: isar.sources
          .filter()
          .idIsNotNull()
          .and()
          .isActiveEqualTo(true)
          .itemTypeEqualTo(itemType)
          .watch(fireImmediately: true),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final entries = snapshot.data!
              .where((element) =>
                  compareVersions(element.version!, element.versionLast!) < 0)
              .toList();
          return entries.isEmpty
              ? Container()
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).focusColor),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      entries.length.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).textTheme.bodySmall!.color),
                    ),
                  ),
                );
        }
        return Container();
      });
}
