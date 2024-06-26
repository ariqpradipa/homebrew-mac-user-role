class MacUserRole < Formula
    desc "Script to change user roles between admin and user on macOS"
    homepage "https://arprd.com"
    url "https://raw.githubusercontent.com/ariqpradipa/homebrew-mac-user-role/main/main/scripts/mac-user-role.sh" # Change this to the path where your script is stored
    version "1.0.0"
    sha256 "ec55561c3ebd073313ba0b70ff839303898cb76e17eab5781d6e696081357cd8" # Use the actual checksum you got
  
    def install
      bin.install "mac-user-role.sh" => "mac-user-role"
    end
  
    def caveats
      <<~EOS
        To change a user role, use the following command:
          sudo mac-user-role <username> <admin|user>
      EOS
    end
  end