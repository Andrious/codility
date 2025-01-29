import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;
import 'dart:math';
import '../../_view.dart';

/// https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
///
/// You are given an array prices where prices[i] is the price of a given stock on the ith day.
/// You want to maximize your profit by choosing a single day to buy one stock and
/// choosing a different day in the future to sell that stock.
///
/// Return the maximum profit you can achieve from this transaction.
/// If you cannot achieve any profit, return 0.
///
///
///
/// Example 1:
///
/// Input: prices = [7,1,5,3,6,4]
/// Output: 5
/// Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
/// Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
/// Example 2:
///
/// Input: prices = [7,6,4,3,1]
/// Output: 0
/// Explanation: In this case, no transactions are done and the max profit = 0.
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
