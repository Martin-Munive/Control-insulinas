import 'package:flutter/material.dart';
import 'package:cardiones/design/design.dart';

class DropdownbuttonWidget extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final ValueChanged<String>? onChanged;

  const DropdownbuttonWidget({super.key, required this.items, this.onChanged});

  @override
  State<DropdownbuttonWidget> createState() => _DropdownbuttonWidgetState();
}

class _DropdownbuttonWidgetState extends State<DropdownbuttonWidget> {
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.items.isNotEmpty ? widget.items.first["nombre"] : '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(context),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorExacto.colorBlanco,
          boxShadow: [
            BoxShadow(
              color: ColorExacto.colornnegroLetras,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                dropdownValue.isNotEmpty
                    ? dropdownValue
                    : "Seleccione una opción",
                style: const TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ),
            ),
            const Icon(Icons.arrow_drop_down,
                color: ColorExacto.colornnegroLetras),
          ],
        ),
      ),
    );
  }

  void _showDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: 400,
          child: _SearchableDropdown(
            items: widget.items,
            onItemSelected: (String value) {
              setState(() {
                dropdownValue = value;
              });
              widget.onChanged?.call(value);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

class _SearchableDropdown extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final ValueChanged<String> onItemSelected;

  const _SearchableDropdown(
      {required this.items, required this.onItemSelected});

  @override
  State<_SearchableDropdown> createState() => _SearchableDropdownState();
}

class _SearchableDropdownState extends State<_SearchableDropdown> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredItems = [];
  int _currentMax = 10;

  @override
  void initState() {
    super.initState();
    _filteredItems = widget.items.take(_currentMax).toList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
      }
    });
  }

  void _loadMoreItems() {
    setState(() {
      int nextMax = _currentMax + 10;
      _filteredItems = widget.items.take(nextMax).toList();
      _currentMax = nextMax;
    });
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = widget.items
          .where((item) =>
              item["nombre"].toLowerCase().contains(query.toLowerCase()))
          .take(_currentMax)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: _filterItems,
            decoration: InputDecoration(
              hintText: "Buscar...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: _filteredItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_filteredItems[index]["nombre"],
                    overflow: TextOverflow.ellipsis, maxLines: 1),
                onTap: () =>
                    widget.onItemSelected(_filteredItems[index]["nombre"]),
              );
            },
          ),
        ),
      ],
    );
  }
}
