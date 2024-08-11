{ pkgs, language ? "ts", tailwind ? false, trpc ? false, nextauth ? false, primsa ? false, drizzle ? false, approuter ? false, git_init ? false, db} : {
  packages = [
    pkgs.nodejs_20
    pkgs.bun
  ];
  bootstrap = ''
    mkdir -p "$out"
    bun create t3-app@latest --CI --tailwind ${tailwind} --trpc ${trpc} --nextauth ${nextauth} --primsa ${primsa} --drizzle ${drizzle} --approuter ${approuter} --git-init ${git_init} --db ${db} "$out"
    cp -rf ${./.idx} "$out"
  '';
}
