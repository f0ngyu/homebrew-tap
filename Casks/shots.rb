cask "shots" do
  version "0.3.4"
  sha256 "db03c74616827a79866b6dc0ce0a7bd5a8bd36fbc74fa818afc3c73a4c557416"

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
