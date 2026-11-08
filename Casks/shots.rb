cask "shots" do
  version "0.2.1"
  sha256 "c768689405d2fae2215b17e4a0460bd823201eac16c0d57e70b769ba8a967960"

  url "https://github.com/f0ngyu/homebrew-tap/releases/download/v#{version}/shots-#{version}-arm64.dmg"
  name "Shots"
  desc "Screenshot, annotation and redaction tool"
  homepage "https://github.com/f0ngyu/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Shots.app"

  # 应用是自签名、没有公证的，去掉隔离标记才能打开。
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Shots.app"]
  end

  uninstall quit: "com.f0ngyu.shots"

  zap trash: [
    "~/Library/Application Support/Shots",
    "~/Library/Logs/Shots",
  ]

  caveats <<~EOS
    Shots 是自签名应用，没有经过 Apple 公证。
    第一次截图时需要在系统设置里授予「屏幕录制」权限，授权后重启应用。
  EOS
end
