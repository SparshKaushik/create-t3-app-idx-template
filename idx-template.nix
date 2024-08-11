{
    pkgs, language, tailwind, trpc, nextauth, primsa, drizzle, approuter, git_init, db
}: {
    packages = [
        pkgs.nodejs_20,
        pkgs.bun
    ];
    bootstrap = ''
        mkdir -p "$out"
        bun create t3-app@latest --CI --language ${language} --tailwind ${tailwind} --trpc ${trpc} --nextauth ${nextauth} --primsa ${primsa} --drizzle ${drizzle} --approuter ${approuter} --git-init ${git_init} --db ${db} "$out"
        cp -rf ${./.idx} "$out"
    ''
}