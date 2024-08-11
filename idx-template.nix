{ pkgs, language ? "ts", tailwind ? false, trpc ? false, nextauth ? false, primsa ? false, drizzle ? false, git_init ? false, db ? "sqlite"} : {
  packages = [
    pkgs.nodejs_20
    pkgs.bun
  ];
  bootstrap = ''
    mkdir -p "$out"
    chmod -R +w "$out"
    cp -rf ${./.idx} "$out"
    bun create t3-app@latest --CI ${if tailwind then "--tailwind" else ""} ${if trpc then "--trpc" else ""} ${if nextauth then "--nextAuth" else ""} ${if primsa then "--primsa" else ""} ${if drizzle then "--drizzle" else ""} ${if git_init then "" else "--noGit"} --dbProvider ${db} "$out"
  '';
}
