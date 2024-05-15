class MacUserRole < Formula
    desc "Script to change user roles between admin and user on macOS"
    homepage "https://your.homepage.url"
    url "./mac-user-role.sh" # Change this to the path where your script is stored
    version "1.0.0"
    sha256 "68bc174d9fc15fd255f4799f3e784f8d123c1d01f4f287ce71c71434c427bcc6" # Use the actual checksum you got
  
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