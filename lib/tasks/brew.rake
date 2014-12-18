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
    output = `brew outdated`
    puts "Found something for brew to upgrade: #{output}" unless output == ''
    output != ''
  end
end
