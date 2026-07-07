cask "hearthgate" do
  version "1.13.0"
  sha256 "8b0551b85ae41d6da3a66b81929f827ed1de8b3b6fa3309f6b2ce157894bf7e9"

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
