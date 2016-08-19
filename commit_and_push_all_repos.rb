#!/usr/bin/env ruby

# This script will commit and push changes from the remote for each git repository in the directory we call it from

# Delete this directory and the parent directory from the list
commitMessage = ''
ARGV.each do |m|
	commitMessage += m
end

directories = Dir.entries(".")
directories.delete_at(0)
directories.delete_at(0)

# Cache username and password so we only have to enter them once
system('git config --global credential.helper cache')

directories.each do |filename|
    if File.directory? filename
		Dir.chdir(filename) do
		  if Dir.entries('.').include? '.git'
			puts 'Committing and pushing ' + filename
			system('git add .')
			system('git commit -m"#{commitMessage}"')
			system('git pull --rebase')
			system('git push')
		  end
		end
	end
end