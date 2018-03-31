self: super: rec {
  emacs2 = super.emacs.overrideAttrs (oldAttrs: rec {
    patches = oldAttrs.patches ++ [ ./emacs_dark_title_bar.patch ];
  });

  customEmacs = (self.emacsPackagesNgGen emacs2).emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    use-package
    evil
    flycheck
    spaceline
    projectile
    go-mode
    counsel
    nix-mode
    company
    fill-column-indicator
    git-gutter
  ]));
}
