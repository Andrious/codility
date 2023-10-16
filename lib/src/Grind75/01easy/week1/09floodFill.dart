import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = [
      [1, 1, 1],
      [1, 1, 0],
      [1, 0, 1]
    ];
    var sr = 1;
    var sc = 1;
    var color = 2;
    var result = floodFill(image, sr, sc, color);
    final data = jsonEncode('nice.');
    return Text(data);
  }
}

List<List<int>> floodFill(List<List<int>> image, int sr, int sc, int color) {
  final currentColor = image[sr][sc];
  _fillColor(image, sr, sc, currentColor, color);
  return image;
}

void _fillColor(
  List<List<int>> image,
  int stackRow,
  int stackCol,
  int currentColor,
  int newColor,
) {
  // Continue only
  // if the passed row and columns are within the image's dimensions.
  // if the pixel is not of the new color
  // if the pixel is of the current color
  if (stackRow < 0 ||
      stackRow >= image.length ||
      stackCol < 0 ||
      stackCol >= image[stackRow].length ||
      image[stackRow][stackCol] == newColor ||
      image[stackRow][stackCol] != currentColor) {
    return;
  }
  // Assign the new Color to the selected pixel.
  image[stackRow][stackCol] = newColor;
  // Now look to all the 'surrounding' pixels.
  _fillColor(image, stackRow + 1, stackCol, currentColor, newColor); // Up
  _fillColor(image, stackRow - 1, stackCol, currentColor, newColor); // Below
  _fillColor(image, stackRow, stackCol + 1, currentColor, newColor); // Right
  _fillColor(image, stackRow, stackCol - 1, currentColor, newColor); // Left
  return;
}
