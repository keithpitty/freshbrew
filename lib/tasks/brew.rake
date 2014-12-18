require 'rake'

namespace :brew do
  task :maintain do
    puts 'Checking if any brew upgrades are required ...'
    if brew_outdated?
      `brew upgrade && brew cleanup`
      puts 'Finished upgrading and cleaning up.'
    else
      puts 'Nothing for brew to upgrade.'
    end

    puts 'Done.'
  end

  def brew_outdated?
    `brew update`
    outdated_output = `brew outdated`
    unless outdated_output == ""
      puts "Found something for brew to upgrade."
      # TODO parse output so that packages being upgraded can be printed.
      puts outdated_output
    end
    outdated_output != ""
  end
end
