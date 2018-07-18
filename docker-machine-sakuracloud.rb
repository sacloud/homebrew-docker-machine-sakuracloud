class DockerMachineSakuracloud < Formula

  _version = "1.2.0"
  sha256_src_darwin = "129627fea667f3b6ad66526d098f7625bcf596dd6de997a9108e820f5f4bb130"
  sha256_src_linux = "c1457a3fad26c9c47b42c122223f32864b254796a79f5247a6379d67f38f488c"

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
