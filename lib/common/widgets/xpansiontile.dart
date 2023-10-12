// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/constants.dart';
import 'bottom_titles.dart';

class XpansionTile extends ConsumerWidget {
  const XpansionTile({
    super.key,
    required this.children,
    required this.text,
    required this.text2,
    this.onExpansionChanged,
    required this.trailing,
  });

  final List<Widget> children;
  final String text;
  final String text2;
  final void Function(bool)? onExpansionChanged;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppConst.kBackgroundLight,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            title: BottomTitles(text: text, text2: text2),
            tilePadding: EdgeInsets.zero,
            childrenPadding: EdgeInsets.zero,
            onExpansionChanged: onExpansionChanged,
            controlAffinity: ListTileControlAffinity.trailing,
            trailing: trailing,
            children: children,
          )),
    );
  }
}
