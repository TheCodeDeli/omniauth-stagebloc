require 'bundler/setup'
Bundler.setup

require 'rspec'
require 'omniauth'
require 'omniauth-stagebloc'

RSpec::Matchers.define :have_info do |field, value|
  match do |actual|
    actual.info[field] == value
  end
  failure_message do |actual|
    "expected '#{field}' to equal #{value} but received #{actual.info.fetch(field, 'nil')}"
  end
end

