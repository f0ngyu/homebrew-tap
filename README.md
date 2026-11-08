# Shots Homebrew Tap

Shots 是一个 macOS 菜单栏截图工具：框选截图、标注、打码、选择文字、滚动长截图。截图和文字识别都在本机完成，不联网。

```sh
brew install --cask f0ngyu/tap/shots
```

要求 macOS 14 或以上，Apple Silicon。

## 安装前请了解

- 这是个人项目，源码没有公开。
- 应用使用自签名证书，**没有经过 Apple 公证**。安装时 Cask 会去掉 macOS 的隔离标记，也就是跳过 Gatekeeper 检查，请确认你信任这个来源。
- 应用需要「屏幕录制」权限才能截图。第一次截图时按提示授权，然后重启应用。

## 卸载

```sh
brew uninstall --cask shots
```

连同设置、截图历史和日志一起删除：

```sh
brew uninstall --zap --cask shots
```
