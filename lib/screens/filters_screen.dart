// import 'package:app4/screens/tabs_screen.dart';
// import 'package:app4/widgets/main_drawer.dart';
import 'package:app4/provider/filters_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget{
 const FiltersScreen({super.key,
  // required this.currentFilters
  });
 //final Map<Filter,bool>currentFilters;
  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
 
}


class _FiltersScreenState extends ConsumerState<FiltersScreen> {
   bool _glutenFreeFilter = false;
  // ignore: non_constant_identifier_names
 bool _lactoseFreeFilter = false;
  // ignore: non_constant_identifier_names
  bool _veganFilter = false;
  // ignore: non_constant_identifier_names
 bool _vegetarianFilter = false;
 @override
  void initState() {
  
    super.initState();
    final activeFilters=
    ref.read(filtersProvider);
  //   _glutenFreeFilter=widget.currentFilters[Filter.glutenFree]!;
   
  //  _lactoseFreeFilter=widget.currentFilters[Filter.lactoseFree]!;
  //   _veganFilter=widget.currentFilters[Filter.vegan]!;
  //   _vegetarianFilter=widget.currentFilters[Filter.Vegetarian]!;
   _glutenFreeFilter=activeFilters[Filter.glutenFree]!;
   
   _lactoseFreeFilter=activeFilters[Filter.lactoseFree]!;
    _veganFilter=activeFilters[Filter.vegan]!;
    _vegetarianFilter=activeFilters[Filter.Vegetarian]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == "meals") {
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(builder: (ctx) => TabsScreen()),
      //       );
      //     }
      //   },
      // ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: () async {
           ref.read(filtersProvider.notifier).setFilters({
  Filter.glutenFree:  _glutenFreeFilter,
            Filter.lactoseFree :_lactoseFreeFilter,
            Filter.vegan : _veganFilter,
            Filter.Vegetarian : _vegetarianFilter,
           });
          // Navigator.of(context).pop({
          
          // });
          return true;
        },
        child: Column(
          children: [
            customSwitch(
              context,
              "Gluten_free",
              "Only include gluten_free meals",
        _glutenFreeFilter,
               (bool value) {
                ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree,value);
          // setState(() {
          //  _glutenFreeFilter = value;
          // });
        },
            ),
            customSwitch(
              context,
              "LactoseFree",
              "Only include lactoseFree meals",
            _lactoseFreeFilter,
            (bool value) {
              ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, value);
          // setState(() {
          //  _lactoseFreeFilter = value;
          // });
        },
            ),
            customSwitch(
              context,
              " VeganFilter",
              "Only include  veganFilter meals",
              _veganFilter,
            (bool value) {ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
          // setState(() {
          //  _veganFilter = value;
          // });
        },
            ),
            customSwitch(
              context,
              "VegetarianFilter",
              "Only includevegetarianFilter meals",
              _vegetarianFilter,
          (bool value) {ref.read(filtersProvider.notifier).setFilter(Filter.Vegetarian, value);
          // setState(() {
          //  _vegetarianFilter = value;
          // });
        },
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile customSwitch(
    BuildContext context,
    String title,
    String subtitle,
    bool filter,
    Function(bool newValue) onChanged,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          // ignore: deprecated_member_use
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
          // ignore: deprecated_member_use
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: EdgeInsets.only(left: 34, right: 22),
      value: filter,
      onChanged: onChanged,
     
    );
  }
}
