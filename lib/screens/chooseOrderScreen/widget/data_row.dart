import 'package:flutter/material.dart';

DataRow customRow(
    {numBuy,
    returnDate,
    goodsCode,
    goodsName,
    number,
    weight,
    unit,
    Function onPress}) {
  var dataRow = DataRow(
    cells: <DataCell>[
      DataCell(Text(numBuy), onTap: onPress),
      DataCell(Text(returnDate), onTap: onPress),
      DataCell(Text(goodsCode), onTap: onPress),
      DataCell(
          Text(
            goodsName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: onPress),
      DataCell(Text(number), onTap: onPress),
      DataCell(Text(weight), onTap: onPress),
      DataCell(Text(unit), onTap: onPress),
    ],
  );
  return dataRow;
}
