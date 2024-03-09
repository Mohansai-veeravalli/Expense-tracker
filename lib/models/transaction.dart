import 'package:flutter/material.dart';

class Transaction {
  Icon? logo;
  double amount;
  String party;
  DateTime date;
  String type; // "borrowed" or "lent"

  Transaction({
    this.logo,
    required this.amount,
    required this.party,
    required this.date,
    required this.type,
  });
}
