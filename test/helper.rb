require "xmlsimple"
require 'fileutils'

def generate_command header_list_file_name, bridgesupport_file_name, options
  options_to_add = options.map do |k, v|
    if k && v && v.strip.length > 0
      "--#{k} \"#{v}\""
    elsif k
      "--#{k}"
    else
      ""
    end
  end.join " "

<<-S
RUBYOPT='' \
'../RubyMotion/bin/gen_bridge_metadata' \
--format complete  \
#{options_to_add} \
--headers "#{header_list_file_name}" \
-o '#{bridgesupport_file_name}'
S
end

def gen_bridge_metadata(header_file_name, options = {})
  default_options = {
    #debug: "", # uncomment this option for full debug trace
    cflags: "-isysroot '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk' -miphoneos-version-min=10.0 -D__ENVIRONMENT_IPHONE_OS_VERSION_MIN_REQUIRED__=120200"
  }
  header_file_include_location = " -I./header -I. -I'.' "
  options = default_options.merge options
  options[:cflags] = " #{header_file_include_location} #{options[:cflags]} "
  output_folder = 'output'
  header_list_file_name = "#{output_folder}/#{header_file_name}.txt"
  bridgesupport_file_name = "#{output_folder}/#{ header_file_name }.bridgesupport"
  repro_script_file_name = "#{output_folder}/#{ header_file_name }.sh"
  FileUtils.mkdir_p output_folder
  File.write header_list_file_name, header_file_name
  command = generate_command header_list_file_name, bridgesupport_file_name, options
  File.write repro_script_file_name, command
  system "#{ command }"
  hash = XmlSimple.xml_in(open(bridgesupport_file_name))
end
