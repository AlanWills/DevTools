#!/usr/bin/env ruby

# This script will commit and push changes from the remote for each git repository in the directory we call it from

# Delete this directory and the parent directory from the list
commitMessage = ''
ARGV.each do |m|
	commitMessage += ' '
	commitMessage += m
end

directories = Dir.entries(".")
directories.delete_at(0)
directories.delete_at(0)

directories.each do |filename|
    if File.directory? filename
		Dir.chdir(filename) do
		  if Dir.entries('.').include? '.git'
			if system('git diff --exit-code')
				puts 'Committing and pushing ' + filename
				system('git add .')
				system("git commit -m\"#{commitMessage}\"")
				system('git pull --rebase')
				system('git push')
			end
		  end
		end
	end
end