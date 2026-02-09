{ pkgs, ... }:
{
  enable = true;
  package = pkgs.vscodium;

  # Not all extensions are packaged...
  mutableExtensionsDir = true;

  profiles.default = {
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;

    extensions = with pkgs.vscode-extensions; [
      # astral-sh.ty
      bbenoist.nix
      # charliermarsh.ruff
      editorconfig.editorconfig
      github.github-vscode-theme
      haskell.haskell
      # jeandeaual.scheme
      justusadam.language-haskell
      llvm-vs-code-extensions.vscode-clangd
      # luceresearchlab.vs-jshell
      mads-hartmann.bash-ide-vscode
      ms-python.python
      ms-toolsai.jupyter
      ms-toolsai.jupyter-renderers
      redhat.java
      redhat.vscode-xml
      streetsidesoftware.code-spell-checker
      vscjava.vscode-gradle
      vscjava.vscode-java-debug
      vscjava.vscode-java-test
    ];

    userSettings = {
      "cSpell.language" = "en,it";

      "editor.bracketPairColorization.enabled" = true;
      "editor.cursorSmoothCaretAnimation"      = "explicit";
      "editor.cursorStyle"                     = "underline";
      "editor.cursorBlinking"                  =  "blink";
      "editor.fontFamily"                      = "'Pending Mono', monospace";
      "editor.glyphMargin"                     = false;
      "editor.minimap.enabled"                 = false;
      "editor.renderWhitespace"                = "all";
      "editor.rulers"                          = [ 80 100 ];
      "editor.scrollBeyondLastLine"            = false;
      "editor.smoothScrolling"                 = true;
      "editor.tabSize"                         = 2;

      "editorconfig.generateAuto" = false;

      "explorer.confirmDelete"      = false;
      "explorer.confirmDragAndDrop" = false;

      "extensions.ignoreRecommendations" = true;

      "files.insertFinalNewline" = true;

      "java.autobuild.enabled"               = false;
      "java.completion.guessMethodArguments" = "off";
      "java.gradle.buildServer.enabled"      = "on";
      "java.server.launchMode"               = "LightWeight";

      "javascript.updateImportsOnFileMove.enabled" = "always";

      "notebook.editorOptionsCustomizations" = {
          "editor.tabSize"      = 4;
          "editor.indentSize"   = 4;
          "editor.insertSpaces" = true;
      };

      "python.languageServer" = "None";

      "redhat.telemetry.enabled" = false;

      "security.workspace.trust.untrustedFiles" = "open";

      "terminal.integrated.allowChords"              = false;
      "terminal.integrated.copyOnSelection"          = false;
      "terminal.integrated.cursorBlinking"           = true;
      "terminal.integrated.cursorStyle"              = "underline";
      "terminal.integrated.fontFamily"               = "Pending Mono";
      "terminal.integrated.macOptionIsMeta"          = true;
      "terminal.integrated.shellIntegration.enabled" = false;

      "telemetry.telemetryLevel" = "off";

      "ty.configuration"                = {
        "rules" = {
          "possibly-unresolved-reference" = "error";
        };
      };
      "ty.inlayHints.callArgumentNames" = false;
      "ty.importStrategy"               = "useBundled";

      "typescript.surveys.enabled"                 = false;
      "typescript.updateImportsOnFileMove.enabled" = "always";

      "window.commandCenter"            = false;
      "window.customTitleBarVisibility" = "windowed";
      "window.titleBarStyle"            = "custom";

      "workbench.activityBar.location"                 = "hidden";
      "workbench.colorTheme"                           = "GitHub Dark";
      "workbench.editor.editorActionsLocation"         = "hidden";
      "workbench.editor.empty.hint"                    = "hidden";
      "workbench.layoutControl.enabled"                = false;
      "workbench.settings.enableNaturalLanguageSearch" = false;
      "workbench.startupEditor"                        = "none";

      "[json]" = {
          "editor.defaultFormatter" = "vscode.json-language-features";
      };
    };
  };
}
