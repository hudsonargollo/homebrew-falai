cask "falai" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.7"
  sha256 arm:   "35be55551c617707229ecafeeda0c4b2a1cd26d137f47d1f20826771198eb5c6",
         intel: "37cd517ff5c8f0c6d112b79dd4ab3427607c6d20c268e25ffe77e4494078d343"

  url "https://github.com/hudsonargollo/falai/releases/download/v#{version}/FalaAi_#{version}_#{arch}.dmg"
  name "FalaAí"
  desc "Ditado por voz offline, em qualquer app"
  homepage "https://falai.tektone.com.br/"

  depends_on macos: :big_sur

  app "FalaAí.app"

  # FalaAí is ad-hoc signed (not notarized), so the quarantine flag Homebrew
  # applies on install would make macOS reject it as "damaged". Strip it after
  # install so `brew install --cask falai` opens cleanly with no Terminal step.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/FalaAí.app"]
  end

  zap trash: [
    "~/Library/Application Support/br.com.falai.app",
    "~/Library/Caches/br.com.falai.app",
    "~/Library/HTTPStorages/br.com.falai.app",
    "~/Library/Preferences/br.com.falai.app.plist",
    "~/Library/Saved Application State/br.com.falai.app.savedState",
  ]
end
