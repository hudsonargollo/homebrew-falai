cask "falai" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.10"
  sha256 arm:   "5ac1a28115129c16533980c1051d3814f59547e297e050c40232994d0065f5b6",
         intel: "683d63cc66024732790d16c468bcb85cebef0489da6539ebd8915caa1fa8a3e9"

  url "https://github.com/hudsonargollo/falai/releases/download/v#{version}/FalaAi_#{version}_#{arch}.dmg",
      verified: "github.com/hudsonargollo/falai/"
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
