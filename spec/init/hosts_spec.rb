require 'spec_helper'

describe '--- history ----------------------------' do
  hostname = host_inventory['hostname']
  describe file('/etc/hostname') do
    its(:content) { should match /^#{hostname}/ }
  end
end
