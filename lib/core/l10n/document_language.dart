// Keeps <html lang dir> in step with the site language, for screen readers
// and search engines. A no-op off the web (tests).
export 'document_language_stub.dart'
    if (dart.library.js_interop) 'document_language_web.dart';
