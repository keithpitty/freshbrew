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
    output = `brew outdated`
    puts "#{time}: *** Outdated packages: #{output}" unless output == ''
    output != ''
  end

  def time
    Time.now.strftime('%F %I:%M%p')
  end
end
