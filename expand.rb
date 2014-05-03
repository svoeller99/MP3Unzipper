# this progam will unzip every ZIP file in the parent directory of this script into its own folder

def expando (currentDir, artistDir, albumDir)
  #puts artistDir, albumDir
  
  makeDir(artistDir)
  moveDir(currentDir, artistDir)
  renameDir("..\\#{artistDir}\\#{currentDir}", albumDir)
end

def makeDir (dirName)
  command = "mkdir \"..\\#{dirName}\""
  puts command
  system command
end

def moveDir (dirName, destDir)
  command = "move \"..\\#{dirName}\" \"..\\#{destDir}\""
  puts command
  system command
end

def renameDir (currentDirName, newDirName)
  command = "rename \"#{currentDirName}\" \"#{newDirName}\""
  puts command
  system command
end

Dir.foreach('..') do |item|
  next if item == '.' or item == '..' or item == 'TOOLS'
  
  flatDirName = item
  expandedDir = /(.*) - (.*)/.match flatDirName
  
  next if expandedDir.nil?
  
  #dirname = /(.*)\.zip/.match item
  
  #command = '7z x "..\\'+filename+'" -o"..\\'+dirname[1].to_str + '"'
  #puts command
  #system command
    
  expando(flatDirName, expandedDir[1], expandedDir[2])
  puts
end

