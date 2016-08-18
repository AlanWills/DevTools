#!/usr/bin/env ruby

# This script will pull changes from the remote for each git repository in the directory we call it from

# Delete this directory and the parent directory from the list
directories = Dir.entries(".")
directories.delete_at(0)
directories.delete_at(0)

directories.each do |filename|
    if File.directory? filename
		Dir.chdir(filename) do
		  if Dir.entries('.').include? '.git'
			puts 'Pulling ' + filename
			system('git pull --rebase')
		  end
		end
	end
end