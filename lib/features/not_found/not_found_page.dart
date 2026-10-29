import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../../core/widgets/pill_button.dart';
import '../shell/site_page.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SitePage(
      title: l10n.notFoundTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.notFoundBody, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 28),
          PillButton(label: l10n.backToHome, onPressed: () => context.go('/')),
        ],
      ),
    );
  }
}
