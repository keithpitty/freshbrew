require 'rake'

namespace :brew do
  task :refresh do
    puts "#{time}: Checking if any brew upgrades are required ..."
    if brew_outdated?
      upgrade_packages
      puts "#{time}: Finished upgrading."
    else
      puts "#{time}: Nothing for brew to upgrade."
    end
  end

  def brew_outdated?
    `brew update`
    puts "#{time}: *** Outdated packages: #{outdated_packages_str}" unless outdated_packages_str == ''
    outdated_packages_str != ''
  end

  def time
    Time.now.strftime('%F %I:%M%p')
  end

  def outdated_packages_str
    @outdated_packages_str ||= `brew outdated`.split(/\s/).join(', ')
  end

  def outdated_packages_array
    outdated_packages_str.split(', ')
  end

  def upgrade_packages
    outdated_packages_array.each { |package| puts `brew upgrade #{package}` }
  end
end
