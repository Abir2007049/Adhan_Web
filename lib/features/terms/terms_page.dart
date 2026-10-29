import 'package:flutter/material.dart';

import '../../core/l10n/generated/app_localizations.dart';
import '../shell/legal_text.dart';
import '../shell/site_page.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SitePage(
      title: l10n.termsTitle,
      child: LegalText(paragraphs: [l10n.termsP1, l10n.termsP2, l10n.termsP3]),
    );
  }
}
