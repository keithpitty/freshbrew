require 'rake'

namespace :brew do
  task :refresh do
    puts "#{time}: Checking if any brew upgrades are required ..."
    if brew_outdated?
      puts `brew upgrade -all`
      puts "#{time}: Finished upgrading."
    else
      puts "#{time}: Nothing for brew to upgrade."
    end
  end

  def brew_outdated?
    `brew update`
    puts "#{time}: *** Outdated packages: #{outdated_packages}" unless outdated_packages == ''
    outdated_packages != ''
  end

  def time
    Time.now.strftime('%F %I:%M%p')
  end

  def outdated_packages
    @outdated_packages ||= `brew outdated`.split(/\s/).join(', ')
  end
end
