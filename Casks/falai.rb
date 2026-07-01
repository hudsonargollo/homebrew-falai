cask "falai" do
  arch arm: "aarch64", intel: "x64"

  version "0.1.12"
  sha256 arm:   "ac1888793303e284385e5b513d02f48ecdcac27af45cba6c4729ac099cd5743d",
         intel: "531f9f76bcd77ccc88e0ee2e616fac5fbd7a3fcb0b5e10df3b5b07d2f07c2ed8"

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
