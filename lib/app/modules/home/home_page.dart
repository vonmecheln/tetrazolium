// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_triple/flutter_triple.dart';
// import 'home_store.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('novo');
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        elevation: 16,
      ),
      body: SafeArea(
        child: ListView.builder(
            // scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            // physics: BouncingScrollPhysics(),

            itemCount: 2,
            itemBuilder: (_, __) {
              return TetraCard();
            }),
      ),
    );
  }
}

class TetraCard extends StatefulWidget {
  const TetraCard({
    Key? key,
  }) : super(key: key);

  @override
  _TetraCardState createState() => _TetraCardState();
}

class _TetraCardState extends State<TetraCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CardC(),
    );
  }
}

class CardC extends StatelessWidget {
  const CardC({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: PainelAnalise(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PainelDanos(),
          ],
        ),
      ],
    );
  }
}

class CardA extends StatefulWidget {
  const CardA({
    Key? key,
  }) : super(key: key);

  @override
  _CardAState createState() => _CardAState();
}

class _CardAState extends State<CardA> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 147,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          PainelAnalise(),
          PainelDanos(),
        ],
      ),
    );
  }
}

class PainelDanos extends StatelessWidget {
  const PainelDanos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DisplayDano(),
              DisplayDano(),
              DisplayDano(),
              DisplayDano(),
            ],
          ),
        ),
      ),
    );
  }
}

class DisplayDano extends StatelessWidget {
  const DisplayDano({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 100,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.settings_outlined,
            color: FlutterFlowTheme.primaryColor,
            size: 35,
          ),
          Text(
            '11',
            style: FlutterFlowTheme.bodyText1.apply(
              fontFamily: 'Roboto',
            ),
          )
        ],
      ),
    );
  }
}

class PainelAnalise extends StatelessWidget {
  const PainelAnalise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lote 01-54',
                  style: FlutterFlowTheme.subtitle1.apply(
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  '02/07/2019',
                  style: FlutterFlowTheme.subtitle2.apply(
                    fontFamily: 'Roboto',
                  ),
                )
              ],
            ),
          ),
          Text(
            'VIG',
            style: FlutterFlowTheme.subtitle2.apply(
              fontFamily: 'Roboto',
            ),
          ),
          Text(
            '86',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.title1.apply(
              fontFamily: 'Roboto',
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Container(
              width: 1,
              height: 19,
              decoration: BoxDecoration(
                color: Color(0xFFD8D8D8),
              ),
            ),
          ),
          Text(
            'VIA',
            style: FlutterFlowTheme.subtitle2.apply(
              fontFamily: 'Roboto',
            ),
          ),
          Text(
            '93',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.title1.apply(
              fontFamily: 'Roboto',
            ),
          )
        ],
      ),
    );
  }
}

class ExpandeCardIcon extends StatefulWidget {
  const ExpandeCardIcon({
    Key? key,
  }) : super(key: key);

  @override
  _ExpandeCardIconState createState() => _ExpandeCardIconState();
}

class _ExpandeCardIconState extends State<ExpandeCardIcon>
    with SingleTickerProviderStateMixin {
  bool expanded = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    var aic = AnimatedIcon(
      icon: AnimatedIcons.search_ellipsis,
      progress: controller,
      color: FlutterFlowTheme.primaryColor,
    );

    var ic = Icon(
      Icons.chevron_left,
      color: FlutterFlowTheme.primaryColor,
      size: 30,
    );

    return IconButton(
      splashColor: Colors.blue,
      onPressed: () {
        setState(() {
          expanded ? controller.forward() : controller.reverse();
          expanded = !expanded;

          print('IconButton pressed ... test');
        });
      },
      icon: aic,
      iconSize: 30,
    );
  }
}

class CardB extends StatelessWidget {
  const CardB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lote 01-54',
                    style: FlutterFlowTheme.subtitle1.apply(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    '02/07/2019',
                    style: FlutterFlowTheme.subtitle2.apply(
                      fontFamily: 'Roboto',
                    ),
                  )
                ],
              ),
            ),
            Text(
              'VIG',
              style: FlutterFlowTheme.subtitle2.apply(
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              '86',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.title1.apply(
                fontFamily: 'Roboto',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Container(
                width: 1,
                height: 19,
                decoration: BoxDecoration(
                  color: Color(0xFFD8D8D8),
                ),
              ),
            ),
            Text(
              'VIA',
              style: FlutterFlowTheme.subtitle2.apply(
                fontFamily: 'Roboto',
              ),
            ),
            Text(
              '93',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.title1.apply(
                fontFamily: 'Roboto',
              ),
            ),
            Align(
              alignment: Alignment(0, 0),
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Icon(
                  Icons.chevron_left,
                  color: FlutterFlowTheme.primaryColor,
                  size: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


/*
class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: ScopedBuilder<HomeStore, Exception, int>(
        store: store,
        onState: (_, counter) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Text('$counter'),
          );
        },
        onError: (context, error) => Center(
          child: Text(
            'Too many clicks',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
*/