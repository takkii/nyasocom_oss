# frozen_string_literal: true
#!/usr/bin/ruby

require 'open3'
require 'fileutils'

# Installer runner.
class InstallerRunner
  # default encoding utf-8, change encode here.
  def self.encoding_style
    Encoding.default_internal = 'UTF-8'
    Encoding.default_external = 'UTF-8'
  end

  def self.run
    encoding_style
    if Dir.exist?(File.expand_path('*/'))
    stdout_ns, _stderr_ns, _status_ns = Open3.capture3("git clone git@github.com:takkii/nyasocom_oss.git . ")
    stdout_ns
    FileUtils.rm_rf(File.expand_path("#{File.dirname(__FILE__)}/.git"))
    end
  end
end

InstallerRunner.run