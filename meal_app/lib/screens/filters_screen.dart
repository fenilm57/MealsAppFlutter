import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FliterScreen extends StatefulWidget {
  static const pageRoute = '/filters';

  final Function filterSave;
  final Map<String, bool> _filters;
  FliterScreen(this._filters, this.filterSave);

  @override
  _FliterScreenState createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  var _glutenFree = false;
  var _vegan = false;
  var _vegitarian = false;
  var _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFree = widget._filters['glutten'];
    _vegan = widget._filters['vegan'];
    _vegitarian = widget._filters['vegetarian'];
    _lactoseFree = widget._filters['lactose'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  Map<String, bool> _filters = {
                    'glutten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegitarian,
                  };
                  widget.filterSave(_filters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: Text('Glutten Free'),
                    subtitle: Text('It\'s Glutten free meal'),
                    value: _glutenFree,
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Lactose Free'),
                    subtitle: Text('It\'s Lactose free meal'),
                    value: _lactoseFree,
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    subtitle: Text('It\'s Vegan meal'),
                    value: _vegan,
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegitarian'),
                    subtitle: Text('It\'s Vegitarian meal'),
                    value: _vegitarian,
                    onChanged: (newValue) {
                      setState(() {
                        _vegitarian = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
