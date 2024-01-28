// icons.dart

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// final List<IconData> iconList = [
//   Icons.coffee_sharp,
//   Icons.music_note_outlined,
//   LineAwesomeIcons.dumbbell,
//   LineAwesomeIcons.t_shirt
//   // Add more icons as needed...
// ];

Map<String, IconData> subcategoryIconMap = {
  'Clothing': LineAwesomeIcons.t_shirt,
  'Music School': Icons.music_note_outlined,
  'Coffee Tea': Icons.coffee_sharp,
  "Indian Restaurant": LineAwesomeIcons.utensils,
  "Gym": LineAwesomeIcons.dumbbell,
  "Restaurant": LineAwesomeIcons.utensils,
  "Pizzeria": LineAwesomeIcons.hamburger,
  "Bakeries": LineAwesomeIcons.birthday_cake,
  "Housingrent": LineAwesomeIcons.city,
  "Bookstore": LineAwesomeIcons.book,

  // Add more mappings as needed...
};

IconData getIconForSubcategory(String subcategory) {
  // Check if the subcategory exists in the map
  if (subcategoryIconMap.containsKey(subcategory)) {
    // Return the corresponding icon
    return subcategoryIconMap[subcategory] ?? Icons.error;
  } else {
    // Return a default icon
    return Icons.error;
  }
}
