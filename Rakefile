require 'rake/testtask'

task default: [:test]

namespace 'selenium' do
  desc 'Run UI regression tests'
  task :test do
    FileList['test/*.rb'].each do |file|
      ruby file
    end
  end

  desc 'Run UI smoke tests'
  task :smoke do
    ruby smoke.rb
  end
end

namespace 'util' do
  desc 'Run unit tests'
  task :unit_test do
    FileList['test/unit/*.rb'].each do |file|
      ruby file
    end
  end
end
