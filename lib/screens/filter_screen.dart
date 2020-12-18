import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetrarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Map<String, bool> updatedFilters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetrarian': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters(updatedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adujust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _bulidSwitchListTitle(
                    title: 'Gluten-free',
                    subTitle: 'Only include gluten-free meals',
                    currentValue: _glutenFree,
                    updateValue: (val) {
                      setState(() {
                        _glutenFree = val;
                        updatedFilters['gluten'] = val;
                      });
                    }),
                _bulidSwitchListTitle(
                    title: 'Lactose-free',
                    subTitle: 'Only include lactose-free meals',
                    currentValue: _lactoseFree,
                    updateValue: (val) {
                      setState(() {
                        _lactoseFree = val;
                        updatedFilters['lactose'] = val;
                      });
                    }),
                _bulidSwitchListTitle(
                    title: 'Vegan',
                    subTitle: 'Only include vegan meals',
                    currentValue: _vegan,
                    updateValue: (val) {
                      setState(() {
                        _vegan = val;
                        updatedFilters['vegan'] = val;
                      });
                    }),
                _bulidSwitchListTitle(
                    title: 'Vegetarian',
                    subTitle: 'Only include vegetarian meals',
                    currentValue: _vegetarian,
                    updateValue: (val) {
                      setState(() {
                        _vegetarian = val;
                        updatedFilters['vegetrarian'] = val;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulidSwitchListTitle(
      {String title,
      String subTitle,
      bool currentValue,
      Function updateValue}) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: (val) {
          updateValue(val);
        });
  }
}
