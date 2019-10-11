class DockerMachineSakuracloud < Formula

  _version = "1.4.1"
  sha256_src_darwin = "4ebdbaa696efdec591158a9fc2e71532b3181de741eb17425e6b553afc6a0ee3"
  sha256_src_linux = "522ba5428da830ae8b4ddf7c810316457d057fac7a00bce089fbf5556f56589e"

  desc "Docker-Machine driver for SakuraCloud"
  homepage "https://github.com/sacloud/docker-machine-sakuracloud"
  head "https://github.com/sacloud/docker-machine-sakuracloud.git"
  version _version

  if OS.mac?
    url "https://github.com/sacloud/docker-machine-sakuracloud/releases/download/v#{_version}/docker-machine-driver-sakuracloud_darwin-amd64.zip"
    sha256 sha256_src_darwin
  else
    url "https://github.com/sacloud/docker-machine-sakuracloud/releases/download/v#{_version}/docker-machine-driver-sakuracloud_linux-amd64.zip"
    sha256 sha256_src_linux
  end

  depends_on "docker-machine" => :run

  def install
    bin.install "docker-machine-driver-sakuracloud"
  end

  test do
    assert_match "sakuracloud-access-token", shell_output("docker-machine create -d sakuracloud -h")
  end
end
