import 'package:flutter/material.dart';
import 'package:tiktak/widgets/minitictactoe.dart';

class MainBoard extends StatelessWidget {
  final void Function(int, int) tapped; // Updated to accept two integers
  final Color getSmallBorderColor;
  final Color getBigBorderColor;
  final List<List<String>> displayElement;
  final Color getTextColor;

  const MainBoard({
    super.key,
    required this.tapped, // Make this parameter required
    required this.getSmallBorderColor,
    required this.getBigBorderColor,
    required this.displayElement,
    required this.getTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int mainBoardIndex) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 3, color: getBigBorderColor, style: BorderStyle.solid),
            ),
            child: MiniTicTacToe(
              getBorderColor: getSmallBorderColor,
              displayElement: displayElement[mainBoardIndex],
              getTextColor: getTextColor,
              tapped: (int miniBoardIndex) {
                tapped(mainBoardIndex, miniBoardIndex); // Pass both indices
              },
            ),
          );
        },
      ),
    );
  }
}
