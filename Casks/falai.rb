cask "falai" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.13"
  sha256 arm:   "2279976f683675867605446e62d9574a253a78f0ba228787d67935188adc720a",
         intel: "fd7602229ec681282fe0521bdb717d8066e560367ba226c7f639ace026b32bb5"

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
