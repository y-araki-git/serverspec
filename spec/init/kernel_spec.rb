require 'spec_helper'

describe '--- kernel ----------------------------' do
  describe 'Linux kernel parameters' do
    context linux_kernel_parameter('vm.overcommit_memory') do 
      its(:value) { should eq 1 }
    end

    context linux_kernel_parameter('net.core.somaxconn') do
      its(:value) { should eq 1024 }
    end

    context linux_kernel_parameter('vm.swappiness') do
      its(:value) { should eq 10 }
    end
  end
end
