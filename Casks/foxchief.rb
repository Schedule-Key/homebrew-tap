cask "foxchief" do
  version "0.2.22,50"
  sha256 "2724727ef7cfa5360f5b82245275f17503196d0a9e3bb9dc7cb38226369a9231"

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

  uninstall launchctl: ["com.brunvo.brunvod", "com.foxchief.foxchiefd"],
            quit:      ["com.brunvo.app", "com.foxchief.app"]

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
        "~/Library/Caches/com.foxchief.app",
        "~/Library/HTTPStorages/com.brunvo.app",
        "~/Library/HTTPStorages/com.foxchief.app",
        "~/Library/Preferences/com.brunvo.app.plist",
        "~/Library/Preferences/com.foxchief.app.plist",
        "~/Library/Saved Application State/com.brunvo.app.savedState",
        "~/Library/Saved Application State/com.foxchief.app.savedState",
      ],
      rmdir: ["~/.foxchief", "~/.brunvo"]
end
