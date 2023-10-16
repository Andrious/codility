import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;
import 'dart:math';
import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prices = [7, 1, 5, 3, 6, 4];
//    prices = [7, 6, 4, 3, 1];
    var result = maxProfit(prices);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int maxProfit(List<int> prices) {
  int profit = 0;
  int minPrice = prices.first;
  for (int i = 1; i < prices.length; i++) {
    // Go through all of them and get the smallest number
//    minPrice = min(minPrice, prices[i]);
    final price = prices[i];
    if (price < minPrice) {
      minPrice = price;
    }
    // Negative numbers are always less 0
//    profit = max(profit, prices[i] - minPrice);
    final newProfit = price - minPrice;
    if (newProfit > profit) {
      profit = newProfit;
    }
  }
  return profit;
}
