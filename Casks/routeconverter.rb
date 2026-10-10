cask "routeconverter" do
  arch arm: "aarch64", intel: "x64"

  version "3.7"
  sha256 arm:   "63efa787a06e8cd4c8e2dc3ff233c945d56e0141c6295fb681db57a2ade6da8c",
         intel: "134563c895a9018921c01d04b5badc5577461656e34c21017de64e103a842077"

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
