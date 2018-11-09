class DockerMachineSakuracloud < Formula

  _version = "1.4.0"
  sha256_src_darwin = "2d7533fb2153762aa397eb4b25df994e312ce8e4783c302ccd4ea2e202336348"
  sha256_src_linux = "5e25e6db85ffb5ddf25e330b13a364db8e2b3e37e062cce45534a99d3afd0b6d"

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
