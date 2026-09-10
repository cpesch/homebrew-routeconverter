cask "routeconverter" do
  arch arm: "aarch64", intel: "x64"

  version "3.6"
  sha256 arm:   "fe375a2078588f6e3885cf39363c38abf90d3492d0044e2dbaa9886ab280918a",
         intel: "6149b8198ad126b5eb91cc810b6a70b90221fab019573c0c00361484c9bf927e"

  url "https://releases.routeconverter.com/previous-releases/#{version}/RouteConverterMac-#{arch}.app.zip"
  name "RouteConverter"
  desc "Convert, edit and visualize GPS routes, tracks and waypoints"
  homepage "https://www.routeconverter.com/"

  livecheck do
    url "https://github.com/cpesch/RouteConverter/releases/latest"
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :big_sur

  app "RouteConverter.app"

  caveats do
    <<~EOS
      RouteConverter.app is signed but not notarized by Apple. On first
      launch, Gatekeeper may block it — right-click the app and choose
      Open, or run:
        xattr -dr com.apple.quarantine "#{appdir}/RouteConverter.app"
    EOS
  end
end
