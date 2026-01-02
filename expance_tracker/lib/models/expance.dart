import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

 final uuid= Uuid();
 final dateformat=DateFormat.yMd();
 enum Category {
  Food, PersonalInvestment, CoursePurchase, Chill
 }

const expanceicon={
  Category.Food:Icons.dinner_dining,
  Category.Chill:Icons.celebration,
  Category.CoursePurchase:Icons.attach_money,
  Category.PersonalInvestment:Icons.business_sharp,

};


class Expance {
   Expance({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }):id=uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get datefixed{
    return dateformat.format(date);
  }
}
