# Author:: Ryan Cragun (<ryan@rightscale.com>)
#
# Copyright (C) 2014, Ryan Cragun
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'kitchen'
require 'kitchen/provisioner/chef_solo'

module Kitchen
  module Provisioner
    # RightLink Chef Solo provisioner.
    class ChefRightLink < ChefSolo
      default_config :require_chef_omnibus, false

      def run_command
        sandbox = '/opt/rightscale/sandbox/bin/'
        [
          sudo("#{sandbox}ruby #{sandbox}chef-solo"),
          "--config #{config[:root_path]}/solo.rb",
          "--json-attributes #{config[:root_path]}/dna.json",
          config[:log_file] ? "--logfile #{config[:log_file]}" : nil,
          "--log_level #{config[:log_level]}"
        ].join(' ')
      end
    end
  end
end
