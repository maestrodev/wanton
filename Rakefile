require 'rake/clean'

directory 'extract'
task :create_extract => 'extract'

task :warble do
  sh "warble"
end

task :package => :warble
task :package => :create_extract

task :package do
  sh "cd extract && jar -xvf ../lib/winstone-0.9.10.jar"
  sh "cp shrinkwrap.war extract/embedded.war"
  sh "cd extract && jar cvfm ../ubuntu10-04.jar META-INF/MANIFEST.MF ."
  sh "cd .."
end

task :default => 'package'

CLEAN.include('extract/')
CLOBBER.include('shrinkwrap.war', 'ubuntu10-04.jar')
