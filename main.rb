#!/usr/bin/ruby

pluginFiles = Dir.glob('plugins/*.rb')

pluginFiles.each do |pluginFileName|
  puts "Loading plugins from #{pluginFileName}"

  require_relative pluginFileName[0...-3]
end

$pluginClasses = Array.new
ObjectSpace.each_object(Class) do |x|
  if /MyPlugins\:/ =~ x.to_s
    $pluginClasses << x
  end
end

puts "Found the following classes / plugins..."
$pluginClasses.each do |plugin|
  # Plugin is actually a class, not a string :)
  puts " > " + plugin.to_s
end