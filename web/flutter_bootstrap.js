{{flutter_js}}
{{flutter_build_config}}

// Remove the HTML splash (see index.html) once the first Flutter frame is up.
_flutter.loader.load({
  onEntrypointLoaded: async (engineInitializer) => {
    const appRunner = await engineInitializer.initializeEngine();
    await appRunner.runApp();
    document.getElementById('splash')?.remove();
  },
});
