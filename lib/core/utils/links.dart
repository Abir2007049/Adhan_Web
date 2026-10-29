import 'package:url_launcher/url_launcher.dart';

/// External links.
///
/// TODO(launch): every value here is a placeholder. Replace before publishing.
abstract final class Links {
  /// Google Play listing. The package id is a placeholder.
  static final playStore = Uri.parse(
    'https://play.google.com/store/apps/details?id=com.example.muslimsoul',
  );

  /// Contact address on a reserved example domain.
  static final contact = Uri.parse('mailto:hello@example.com');

  /// Source repository.
  static final github = Uri.parse('https://github.com/your-org/muslim-soul');
}

Future<void> openExternal(Uri uri) => launchUrl(
  uri,
  webOnlyWindowName: uri.scheme == 'mailto' ? '_self' : '_blank',
);
