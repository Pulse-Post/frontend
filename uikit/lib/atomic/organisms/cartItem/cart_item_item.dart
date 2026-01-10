// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class CartItemItem extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final String iconRemove;
  final String iconIncrement;
  final String iconDecrement;

  final int amount;
  final void Function() onTapItem;
  final void Function() onTapRemove;
  final void Function() onTapIcrement;
  final void Function() onTapDecrement;

  const CartItemItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.iconRemove,
    required this.iconIncrement,
    required this.iconDecrement,
    required this.amount,
    required this.onTapItem,
    required this.onTapRemove,
    required this.onTapIcrement,
    required this.onTapDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        spacing: SizeToken.sm,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: onTapItem,
              borderRadius: BorderRadius.circular(
                SizeToken.xxs,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SizeToken.sm,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          SizeToken.xs,
                        ),
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextLabelL2Dark(
                              text: name,
                              overflow: true,
                              maxLines: 2,
                            ),
                            TextBodyB2SemiDark(
                              text: price,
                              overflow: true,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconLargeDark(
                isNarrow: true,
                icon: iconRemove,
                padding: 0,
                onTap: onTapRemove,
              ),
              Row(
                spacing: SizeToken.sm,
                children: [
                  IconLargeDark(
                    isNarrow: true,
                    icon: iconDecrement,
                    padding: 0,
                    onTap: onTapDecrement,
                  ),
                  TextBodyB1Dark(
                    text: amount.toString(),
                  ),
                  IconLargeDark(
                    isNarrow: true,
                    icon: iconIncrement,
                    padding: 0,
                    onTap: onTapIcrement,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
