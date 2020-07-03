import 'package:flutter/material.dart';
import 'package:ui_dynamo/localization/localizations.dart';
import 'package:ui_dynamo/media_utils.dart';
import 'package:ui_dynamo/mediaquery/media_query_toolbar.dart';
import 'package:ui_dynamo/models.dart';
import 'package:ui_dynamo/ui/drawer/drawer.dart';
import 'package:ui_dynamo/ui/drawer/drawer_provider.dart';
import 'package:ui_dynamo/ui/model/page.dart';

class DynamoHomePage extends StatelessWidget {
  final DynamoData data;

  const DynamoHomePage({
    Key key,
    @required this.data,
  }) : super(key: key);

  void _selectPage(
      DynamoPage page, DynamoItem folder, BuildContext context) {
    context.drawerProvider
        .select(context, folder.key, page.key, popDrawer: true);
  }

  buildRoutesListing(DynamoPage selectedPage, BuildContext context,
          DynamoData data) =>
      Row(
        children: [
          Flexible(
            child: Container(
              constraints: BoxConstraints(maxWidth: 500),
              child: Card(
                margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: RoutesList(
                  shrinkWrap: true,
                  data: data,
                  selectedPage: selectedPage,
                  onSelectPage: (folder, page) =>
                      _selectPage(page, folder, context),
                ),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final selectedPage = selectedPageFromWidget(data, context);
    final watch = context.isWatch;
    final padding = watch ? 8.0 : 32.0;
    final localizations = DynamoLocalizations.of(context);
    return Container(
      padding: EdgeInsets.only(left: padding, right: padding),
      alignment: AlignmentDirectional.center,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 32,
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16.0,
            runSpacing: 16.0,
            children: [
              Icon(
                Icons.book,
                size: 50,
              ),
              Text(
                localizations.homeTitle,
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Text.rich(
            TextSpan(children: [
              ...localizations.description1
                  .toWidgetSpan({'image1': Icon(Icons.book)}),
            ]),
            style: TextStyle(fontSize: 20),
          ),
          buildRoutesListing(selectedPage, context,
              data.copyWith(items: data.items.sublist(0, 1))),
          SizedBox(
            height: 16,
          ),
          Text.rich(
            TextSpan(children: [
              ...localizations.description2.toWidgetSpan({
                'folder': Icon(Icons.folder),
                'menu': Icon(Icons.menu),
              }),
            ]),
            style: TextStyle(fontSize: 20),
          ),
          buildRoutesListing(selectedPage, context,
              data.copyWith(items: data.items.sublist(1))),
          SizedBox(
            height: 16,
          ),
          Text(
            localizations.description3,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Flexible(
                child: MediaQueryToolbar(),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            localizations.description4,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
