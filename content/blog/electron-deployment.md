+++
title = "Electron deployment with GitHub Actions"
date = 2025-01-24

[extra]
repo_view = true
+++

For my senior project course, my group decided to build a project using Electron. Our app offers an interactive, customizable, and stress-free solution to file management.

> Maybe I'll describe it more in detail after the semester. ;)

[Electron](https://www.electronjs.org/) is an open-source software framework designed toward building desktop applications using web technologies. An "Electron app" is basically a glorified website running outside of a web browser. We decided on using [Electron Forge](https://www.electronforge.io) to quickstart the project and utilize its integrated tooling.

For our preliminary sprint, I was tasked with researching and implementing a deployment setup. My objective was to make our application available to the public for Windows and macOS — ideally without telling people to just compile it themselves. I had never done anything like this before, but the challenge excited me.

## Manual deployment

Automation would require some hard work, so I wanted a manual deployment strategy first. This would involve precompiling binaries for various platforms and making them available for download.

I could easily compile and run the project on Windows and NixOS; I just had to figure out how to compile for different platforms on a single machine.

Luckily, Electron Forge's CLI docs includes a [helpful passage](https://www.electronforge.io/cli):

> \[`electron-builder package`] will package your application into a platform-specific executable bundle and put the result in a folder.

Below, we are also informed that the target platform is specified with the `-p/--platform` flag.

Sounds good! Here is an example of what I did on NixOS:

```bash
# Install project dependencies.
$ npm install

# Install further dependencies in an isolated shell.
$ nix-shell -p dpkg fakeroot rpm

# Compile a binary for Windows.
$ npm run package -- -p win32
```

This creates a whole lot of files in `out/electron-forge-app-win32-x64/`, including an executable file. I sent the files to my Windows machine, and the app worked great!

Zipping each of these directories and uploading them to GitHub would be probably be a sufficient deployment solution, but imagine how cool it would be if this was all automated.

## Automatic deployment

Since I have some experience with GitHub Actions, I decided to give that a shot.

[GitHub Actions](https://docs.github.com/en/actions) is GitHub's integrated, multi-purpose CI/CD platform. I love that it sits neatly inside your project and interacts closely with repository activity.

Unfortunately, I couldn't find a functional pre-made Action for Electron deployment. Many haven't been maintained in years. I eventually settled on [johannesjo/action-electron-builder](https://github.com/johannesjo/action-electron-builder), which is a fork of a project long since abandoned.

The first of many errors came along:

```
npm error npx canceled due to missing packages and no YES option: ["electron-builder@25.1.8"]
```

It took me a little too long to figure out that I only needed to include electron-builder as a dependency in `package.json`:

```diff
  "devDependencies": {
    ~~ truncated ~~
    "electron": "34.0.0",
+   "electron-builder": "25.1.8"
  },
```

> In my defense, I've never really used npm like this before. Actually, I should get a court-appointed lawyer.

The next error has some funny formatting, but it isn't as crazy as it looks:

```
⨯ 403 Forbidden
"method: post url: https://api.github.com/repos/massivebird/electron-forge-test
/releases\n\n          Data:\n          {\"message\":\"Resource not accessible
by integration\",\"documentation_url\":\"https://docs.github.com/rest/releases/
releases#create-a-release\",\"status\":\"403\"}\n          "
```
