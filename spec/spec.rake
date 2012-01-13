require 'rake/testtask'

test_tasks = Dir['spec/*/'].map { |d| File.basename(d) }.reject { |d| d =~ /support/ }

test_tasks.each do |folder|
  Rake::TestTask.new("spec:#{folder}") do |spec|
    spec.pattern = "spec/#{folder}/**/*_spec.rb"
    spec.verbose = true
  end
end

desc "Run application test suite"
task 'spec' => test_tasks.map { |f| "spec:#{f}" }
