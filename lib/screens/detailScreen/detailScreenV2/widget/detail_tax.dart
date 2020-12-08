import 'package:flutter/material.dart';
import 'package:invoice/models/tax_cards.dart';
import 'package:invoice/screens/detailScreen/widget/custom_card_tax.dart';

class DetailTaxCard extends StatelessWidget {
  const DetailTaxCard({
    Key key,
    @required double width,
    @required double height,
    @required this.taxCards,
  })  : _width = width,
        _height = height,
        super(key: key);

  final double _width;
  final double _height;
  final List<TaxCards> taxCards;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 30, top: 8, bottom: 10, right: 32),
          width: _width * 0.85,
          height: _height * 0.70,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            children: List.generate(
              taxCards.length,
              (index) => CustomCardTax(
                codeTax: taxCards[index].codeTax,
                nameTax: taxCards[index].nameTax,
                numTax: taxCards[index].numTax,
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 10),
            height: 30,
            child: Center(child: Text("OOOOO")))
      ],
    );
  }
}
