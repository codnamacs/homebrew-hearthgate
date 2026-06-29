cask "hearthgate" do
  version "1.9.1"
  sha256 "820206204b71b5d5d48f5593b29745d235e95fbaa98b4953bac24a4e0c8b1c1a"

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
