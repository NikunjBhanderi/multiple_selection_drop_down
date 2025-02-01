// TODO: comment add for understanding

import 'package:flutter/material.dart';

class MultipleSelectionDropDownView<T> extends StatefulWidget {
  final List<T> items;
  final List<T> selectedItemList;
  final String Function(T) displayText;
  final void Function(List<T>) onChange;
  final Decoration? boxDecoration;
  final String? withOutSelectionText;
  final String? dropDownHeadingText;
  final TextStyle? textStyle;
  final TextStyle? dropDownHeadingTextStyle;
  final TextStyle? dropDownItemTextStyle;
  final TextStyle? searchBarTextStyle;
  final InputDecoration? searchBarDecoration;
  final Color? checkBoxActiveColor;
  final Widget? doneButton;
  final double? dropDownHeight;
  final double? dropDownWidth;
  final Color? dropDownBgColor;

  const MultipleSelectionDropDownView({
    super.key,
    required this.items,
    required this.selectedItemList,
    required this.displayText,
    required this.onChange,
    this.boxDecoration,
    this.withOutSelectionText,
    this.dropDownHeadingText,
    this.textStyle,
    this.dropDownHeadingTextStyle,
    this.dropDownItemTextStyle,
    this.searchBarTextStyle,
    this.searchBarDecoration,
    this.checkBoxActiveColor,
    this.doneButton,
    this.dropDownHeight,
    this.dropDownWidth,
    this.dropDownBgColor,
  });

  @override
  State<MultipleSelectionDropDownView> createState() =>
      _MultipleSelectionDropDownViewState<T>();
}

class _MultipleSelectionDropDownViewState<T>
    extends State<MultipleSelectionDropDownView<T>> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showMultiSelectDialog(context),
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: widget.boxDecoration ??
            BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
        child: Text(
          widget.selectedItemList.isEmpty
              ? widget.withOutSelectionText ?? 'Select Items'
              : widget.selectedItemList
                  .map((e) => widget.displayText(e))
                  .join(', '),
          style: widget.textStyle ?? TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  void _showMultiSelectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: widget.dropDownBgColor,
        title: Text(
          widget.dropDownHeadingText ?? 'Select Items',
          style: widget.dropDownHeadingTextStyle ??
              TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // content: SizedBox(
        //   height: widget.dropDownHeight ?? MediaQuery.of(context).size.height,
        //   width: widget.dropDownWidth ?? MediaQuery.of(context).size.width,
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       TextField(
        //         controller: searchController,
        //         style: widget.searchBarTextStyle ??
        //             TextStyle(fontSize: 14, color: Colors.black),
        //         decoration: widget.searchBarDecoration ??
        //             InputDecoration(
        //               labelText: 'Search',
        //               labelStyle: TextStyle(fontSize: 14),
        //               border: OutlineInputBorder(),
        //               contentPadding: EdgeInsets.symmetric(
        //                 horizontal: 10,
        //                 vertical: 10,
        //               ),
        //             ),
        //         onChanged: (query) => filterItems(query),
        //       ),
        //       const SizedBox(height: 10),
        //       Expanded(
        //         child: ListView(
        //           shrinkWrap: true,
        //           children: filteredItems
        //               .map(
        //                 (item) => CheckboxListTile(
        //                   title: Text(
        //                     widget.displayText(item),
        //                     style: widget.dropDownItemTextStyle ??
        //                         TextStyle(
        //                           fontSize: 14,
        //                           color: Colors.black,
        //                         ),
        //                   ),
        //                   activeColor: widget.checkBoxActiveColor ??
        //                       Theme.of(context).primaryColor,
        //                   value: selectedItems.contains(item),
        //                   onChanged: (isChecked) {
        //                     toggleSelection(item);
        //                   },
        //                 ),
        //               )
        //               .toList(),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        content: ItemBuilderView(
          items: widget.items,
          selectedItems: widget.selectedItemList,
          displayText: widget.displayText,
          onChange: widget.onChange,
          dropDownHeight: widget.dropDownHeight,
          dropDownWidth: widget.dropDownWidth,
          dropDownItemTextStyle: widget.dropDownItemTextStyle,
          searchBarTextStyle: widget.searchBarTextStyle,
          searchBarDecoration: widget.searchBarDecoration,
          checkBoxActiveColor: widget.checkBoxActiveColor,
        ),
        actions: [
          widget.doneButton ??
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Done"),
              ),
        ],
      ),
    );
  }
}

class ItemBuilderView<T> extends StatefulWidget {
  final List<T> items;
  final List<T> selectedItems;
  final String Function(T) displayText;
  final void Function(List<T>) onChange;
  final double? dropDownHeight;
  final double? dropDownWidth;
  final TextStyle? dropDownItemTextStyle;
  final TextStyle? searchBarTextStyle;
  final InputDecoration? searchBarDecoration;
  final Color? checkBoxActiveColor;

  const ItemBuilderView({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.displayText,
    required this.onChange,
    required this.dropDownHeight,
    required this.dropDownWidth,
    required this.dropDownItemTextStyle,
    required this.searchBarTextStyle,
    required this.searchBarDecoration,
    required this.checkBoxActiveColor,
  });

  @override
  State<ItemBuilderView<T>> createState() => _ItemBuilderViewState<T>();
}

class _ItemBuilderViewState<T> extends State<ItemBuilderView<T>> {
  TextEditingController searchController = TextEditingController();
  List<T> selectedItems = [];
  List<T> filteredItems = [];

  @override
  void initState() {
    filteredItems = widget.items;
    selectedItems = widget.selectedItems;
    super.initState();
  }

  void toggleSelection(T item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
      widget.onChange.call(selectedItems);
    });
  }

  void filterItems(String query) {
    setState(
      () {
        if (query.isEmpty) {
          filteredItems = List.from(widget.items);
        } else {
          filteredItems = widget.items
              .where(
                (item) => widget
                    .displayText(item)
                    .toLowerCase()
                    .contains(query.toLowerCase()),
              )
              .toList();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.dropDownHeight ?? MediaQuery.of(context).size.height,
      width: widget.dropDownWidth ?? MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: searchController,
            style: widget.searchBarTextStyle ??
                TextStyle(fontSize: 14, color: Colors.black),
            decoration: widget.searchBarDecoration ??
                InputDecoration(
                  labelText: 'Search',
                  labelStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                ),
            onChanged: (query) => filterItems(query),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: filteredItems
                  .map(
                    (item) => CheckboxListTile(
                      title: Text(
                        widget.displayText(item),
                        style: widget.dropDownItemTextStyle ??
                            TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                      ),
                      activeColor: widget.checkBoxActiveColor ??
                          Theme.of(context).primaryColor,
                      value: selectedItems.contains(item),
                      onChanged: (isChecked) {
                        toggleSelection(item);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
