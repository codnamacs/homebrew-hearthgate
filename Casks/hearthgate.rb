cask "hearthgate" do
  version "1.14.0"
  sha256 "9a82558810cbe618b28d7704d6993dfa4ee4e811c79a42b17d638a32a9550ca4"

  url "https://updates.codnamacs.com/HearthGate-#{version}.dmg",
      verified: "updates.codnamacs.com/"
  name "HearthGate"
  desc "Secure SSH+VNC gateway for macOS — lockdown-first remote desktop"
  homepage "https://hearthgate.codnamacs.com"

  livecheck do
    url "https://updates.codnamacs.com/HearthGate-appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "HearthGate.app"

  uninstall quit:      "app.codnamacs.HearthGate",
            launchctl: "app.codnamacs.HearthGate.helper",
            pkgutil:   "app.codnamacs.HearthGate.helper"

  zap trash: [
    "~/Library/Application Support/HearthGate",
    "~/Library/Preferences/app.codnamacs.HearthGate.plist",
    "~/Library/Caches/app.codnamacs.HearthGate",
  ]
end
