require 'spec_helper'

module Kitchen
  # ChefRightLink provision spec
  module Provisioner
    describe ChefRightLink do

      let(:provisioner) do
        Kitchen::Provisioner::ChefRightLink.new
      end

      it 'uses the sandboxed ruby and chef solo' do
        ruby = %r(^sudo -E /opt/rightscale/sandbox/bin/ruby)
        chef_solo = %r(/opt/rightscale/sandbox/bin/chef-solo)
        expect(provisioner.run_command).to match(/#{ruby} #{chef_solo}/)
      end
    end
  end
end
