# this progam will unzip every ZIP file in the parent directory of this script into its own folder
Dir.foreach('..') do |item|
  next if item == '.' or item == '..' or item == 'TOOLS'
  
  filename = item
  dirname = /(.*)\.zip/.match item
  
  next if dirname.nil?
  
  command = 'unzip "../'+filename+'" -d "../'+dirname[1].to_str + '"'
  puts command
  system command
  command = 'rm "../'+filename+'"'
  puts command
  system command

end