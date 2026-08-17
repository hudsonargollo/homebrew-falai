cask "falai" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.19"
  sha256 arm:   "cb5e0acc65b8afe4ee87615884bf3b8616ea4cf383ce7bc13d42c504b721bdda",
         intel: "699331df672b7559216eb2e5edcc839893a236c4cb5f92cdd0f1c89bafaf8533"

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
