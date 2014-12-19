require 'rake'

namespace :brew do
  task :maintain do
    puts "#{time}: Checking if any brew upgrades are required ..."
    if brew_outdated?
      `brew upgrade && brew cleanup`
      puts "#{time}: Finished upgrading and cleaning up."
    else
      puts "#{time}: Nothing for brew to upgrade."
    end
  end

  def brew_outdated?
    `brew update`
    output = `brew outdated`
    puts "#{time}: About to upgrade: #{output}" unless output == ''
    output != ''
  end

  def time
    Time.now.strftime('%F %I:%M%p')
  end
end
