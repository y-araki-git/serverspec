require 'spec_helper'

describe "--- resolv ----------------------------" do
  describe file('/etc/resolv.conf') do
    its(:content) { should match /^nameserver #{property[:nameserver1]}/ }
    its(:content) { should match /^nameserver #{property[:nameserver2]}/ }
  end 
end 

