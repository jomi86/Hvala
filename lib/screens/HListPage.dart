import 'package:Hvala/custom_widgets/row_button_actions_simple.dart';
import 'package:Hvala/custom_widgets/row_button_expanded.dart';
import 'package:Hvala/models/model_page_arguments.dart';
import 'package:Hvala/models/model_simple_list_item.dart';
import 'package:Hvala/theme/HColors.dart';
import 'package:Hvala/utils/item_actions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HListPage extends StatefulWidget {
  final List<Map<String, String>> resourceUrl;

  const HListPage({Key key, this.resourceUrl}) : super(key: key);

  @override
  _HListPageState createState() => _HListPageState(resourceUrl);
}

class _HListPageState extends State<HListPage> {
  final List<Map<String, String>> resourceUrl;
  List<SimpleListItem> urls;
  List<SimpleListItem> urlsAll;

  _HListPageState(this.resourceUrl);

  @override
  Widget build(BuildContext context) {
    final PageArguments arguments = ModalRoute.of(context).settings.arguments;
    final List<Map<String, String>> resourceUrl = arguments.resource;
    urls = resourceUrl.map((data) => SimpleListItem.fromJson(data)).toList();
    urlsAll = List.of(urls);
    return Scaffold(
        appBar: AppBar(
          title: Text(arguments.name),
        ),
        backgroundColor: HColors.backgroundColor(),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
          child: SingleChildScrollView(
              child: Column(
                  children: new List.generate(
                      urls.length,
                      (i) => urls[i].description.isEmpty == false
                          ? ExpandedRowButton(
                              item: urls[i],
                              onPressedAction: () {
                                simpleItemAction(urls[i]);
                              },
                              onFavoritePressedAction: () {
                                setState(() {});
                              })
                          : SimpleActionsRowButton(
                              item: urls[i],
                              onPressedAction: () {
                                simpleItemAction(urls[i]);
                              })))),
        )));
  }
}
