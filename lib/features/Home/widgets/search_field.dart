import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_constants.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: searchController,
        cursorColor: AppConstants().PrimaryColor,
        cursorHeight: 20,
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(fontSize: 13),
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
