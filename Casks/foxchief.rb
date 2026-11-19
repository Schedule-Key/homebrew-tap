cask "foxchief" do
  version "0.2.21,47"
  sha256 "e86ebd4c9912a36487ee2e3b6a11e939c3eaf091105f3aa42d4358df7b429a2f"

  url "https://download.foxchief.com/mac/#{version.csv.first}/#{version.csv.second}/FoxChief-#{version.csv.first}.dmg"
  name "FoxChief"
  desc "Terminal workspace for running many AI coding agents"
  homepage "https://foxchief.com/"

  livecheck do
    url "https://download.foxchief.com/latest/mac.json"
    strategy :json do |json|
      "#{json["version"]},#{json["build"]}"
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "FoxChief.app"
  binary "#{appdir}/FoxChief.app/Contents/Helpers/foxchief"

  uninstall launchctl: "com.brunvo.brunvod",
            quit:      "com.brunvo.app"

  zap trash: [
        "~/.brunvo/bin/brunvo",
        "~/.brunvo/bin/foxchief",
        "~/.brunvo/prompts",
        "~/.brunvo/run",
        "~/.foxchief/bin/brunvo",
        "~/.foxchief/bin/foxchief",
        "~/.foxchief/prompts",
        "~/.foxchief/run",
        "~/Library/Application Support/Brunvo",
        "~/Library/Application Support/FoxChief",
        "~/Library/Caches/com.brunvo.app",
        "~/Library/HTTPStorages/com.brunvo.app",
        "~/Library/Preferences/com.brunvo.app.plist",
        "~/Library/Saved Application State/com.brunvo.app.savedState",
      ],
      rmdir: ["~/.foxchief", "~/.brunvo"]
end
