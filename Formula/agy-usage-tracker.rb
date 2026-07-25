class AgyUsageTracker < Formula
  desc "SwiftBar widget for monitoring agy usage"
  homepage "https://github.com/Shempaiii/agy-usage-tracker"
  url "https://github.com/Shempaiii/agy-usage-tracker.git", branch: "main"
  version "1.0.0"

  depends_on "python@3.12"
  depends_on "tmux"

  def install
    (share/"agy-usage-tracker").install "agy_usage.30s.py"
    (share/"agy-usage-tracker").install "get_agy_usage.sh"
    (share/"agy-usage-tracker").install "setup_widget.sh"
    (share/"agy-usage-tracker").install "uninstall_widget.sh"
    bin.install_symlink share/"agy-usage-tracker/uninstall_widget.sh" => "agy-usage-tracker-uninstall"
  end

  def post_install
    # Automatically setup the widget for the user after installation
    system "bash", "#{share}/agy-usage-tracker/setup_widget.sh"
  end

  def caveats
    <<~EOS
      To use this SwiftBar widget, run the setup script:
        bash #{share}/agy-usage-tracker/setup_widget.sh
        
      Alternatively, symlink the python script to your SwiftBar plugins folder:
        ln -sf #{share}/agy-usage-tracker/agy_usage.30s.py ~/path/to/your/swiftbar/plugins/
        
      To completely uninstall the widget from SwiftBar before removing the formula, run:
        agy-usage-tracker-uninstall
    EOS
  end
end
