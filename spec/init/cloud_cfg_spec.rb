require 'spec_helper'

describe '--- cloud_cfg ----------------------------' do
  describe file('/etc/cloud/cloud.cfg'), :if => os[:family] == 'debian' do
    its(:content) { should match /manage_etc_hosts: false\n/ }
  end 
end 
