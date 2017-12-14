class DockerMachineSakuracloud < Formula

  _version = "1.1.0"
  sha256_src_darwin = "48c5481efd86002741e862c1bf8165fc1ddfe4dfd9b60379da24e6894c4dc8d9"
  sha256_src_linux = "41c7a54d7d86e407b1a624595d641731aa3115f0d98e2b587bf2facbeb6aa653"

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
