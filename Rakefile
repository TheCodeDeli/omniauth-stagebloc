require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
  t.ruby_opts = "-I./spec -rspec_helper"
  t.rspec_opts = %w[--format progress]
end

task default: :spec

