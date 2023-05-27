import 'package:flutter/material.dart';

class IconButtonWithSize extends StatelessWidget {
  final int iconCase;
  final String textString;
  final VoidCallback onPressed;

  const IconButtonWithSize({
    required this.onPressed,
    required this.iconCase,
    required this.textString,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: iconCase == 1
              ? Icon(
                  Icons.description_outlined,
                  color: Colors.black,
                  size: 40,
                )
              : iconCase == 2
                  ? Icon(
                      Icons.card_giftcard_outlined,
                      color: Colors.black,
                      size: 40,
                    )
                  : iconCase == 3
                      ? Icon(
                          Icons.description_outlined,
                          color: Colors.black,
                          size: 40,
                        )
                      : iconCase == 4
                          ? Icon(
                              Icons.loyalty_outlined,
                              color: Colors.black,
                              size: 40,
                            )
                          : iconCase == 5
                              ? Icon(
                                  Icons.card_membership,
                                  color: Colors.black,
                                  size: 40,
                                )
                              : iconCase == 6
                                  ? Icon(Icons.format_list_bulleted,
                                      size: 40, color: Colors.black)
                                  : Icon(
                                      Icons.description_outlined,
                                      color: Colors.black,
                                      size: 40,
                                    ),
          onPressed: onPressed,
          padding: EdgeInsets.all(0),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          textString,
          style: ts.copyWith(fontSize: 12, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
