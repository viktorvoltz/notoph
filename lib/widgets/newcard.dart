import 'package:flutter/material.dart';

/*Widget cards() {
  return Column(
    children: [
      Text('\$'),
      Container(
        margin: EdgeInsets.only(bottom: 1),
        height: 80,
        width: 70,
        child: Card(
          color: Colors.white,
          elevation: 15,
        ),
      ),
      Text('mon'),
    ],
  );
}

Widget ford() {
  return Card(
    margin: EdgeInsets.only(top: 15, bottom: 20),
    color: Colors.green,
    elevation: 10,
    child: Container(
      width: 300,
      height: 120,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            cards(),
            cards(),
            cards(),
            cards(),
            cards(),
            cards(),
            cards(),
          ],
        ),
      ),
    ),
  );
}*/

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return  Column(
      children: <Widget>[
        Container(
          height: constraints.maxHeight * 0.15,
          child: FittedBox(
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
            ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(
          height: constraints.maxHeight * 0.6,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.05,
        ),
        Container(height: constraints.maxHeight * 0.15, child: FittedBox(child: Text(label, style: TextStyle(fontWeight: FontWeight.w500),))),
      ],
    );
    });
   
  }
}
