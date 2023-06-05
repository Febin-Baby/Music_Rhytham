import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListtileCustomWidget extends StatelessWidget {
  final int index;
  final BuildContext context;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing1;
  final Widget? trailing2;

  ListtileCustomWidget(
      {super.key,
      required this.index,
      required this.context,
      this.leading,
      this.title,
      this.subtitle,
      this.trailing1,
      this.trailing2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      height: 75,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              height: 53,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5), child: leading),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18, bottom: 7),
                  child: title),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: subtitle,
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.01,
          ),
          Expanded(
            child: trailing1 == null
                ? const SizedBox()
                : SizedBox(
                    child: trailing1,
                  ),
          ),
          Expanded(
            child: trailing2 == null
                ? const SizedBox()
                : SizedBox(
                    child: trailing2,
                  ),
          ),
        ],
      ),
    );
  }
}
