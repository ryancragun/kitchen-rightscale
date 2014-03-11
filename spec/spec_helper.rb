require 'bundler/setup'
require 'kitchen/provisioner/chef_right_link'
require 'kitchen/driver/rightscale_vagrant'

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
