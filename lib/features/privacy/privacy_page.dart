import 'package:flutter/material.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../shell/legal_text.dart';
import '../shell/site_page.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SitePage(
      title: l10n.privacyTitle,
      child: LegalText(
        paragraphs: [l10n.privacyP1, l10n.privacyP2, l10n.privacyP3],
      ),
    );
  }
}
