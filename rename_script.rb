Dir.glob("*.rb").each do |entry|
  if File.basename(entry, File.extname(entry))
    name = entry.split("p")
    new_name = "p#{name.first}.#{name.last}"
    File.rename( entry, new_name )
    puts "Rename from " + entry + " to " + new_name
  end
end