/// Landing-page sections that have their own URL, such as `/features`.
enum HomeSection {
  features('features'),
  prayerTimes('prayer-times'),
  themes('themes'),
  iconStyles('icon-styles'),
  languages('languages'),
  screenshots('screenshots'),
  faq('faq'),
  download('download');

  const HomeSection(this.slug);

  final String slug;

  String get path => '/$slug';

  static HomeSection? fromSlug(String? slug) {
    for (final section in values) {
      if (section.slug == slug) return section;
    }
    return null;
  }
}
