import 'package:flutter/material.dart';

class SearchBarHeader extends StatefulWidget {
  const SearchBarHeader({super.key});

  @override
  State<SearchBarHeader> createState() => _SearchBarHeaderState();
}

class _SearchBarHeaderState extends State<SearchBarHeader> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff81194c).withOpacity(0.1),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xff81194c))
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          hintText: "Search flights",
          hintStyle: const TextStyle(color: Colors.black),
          prefixIcon: const Icon(Icons.search, color: Colors.black54, size: 21,)
      ),
    );
  }
}
