require 'spec_helper'

describe '--- ntp ----------------------------' do
  describe package('ntp') do
    it { should be_installed }
  end

  describe file('/etc/ntp.conf') do
    its(:content) { should match /server #{property[:ntpserver]}/ }
  end

  describe service('ntp'), :if => os[:family] == 'debian' do
    it { should be_enabled }
    it { should be_running }
  end

  describe service('ntpd'), :if => os[:family] == 'redhat' do
    it { should be_enabled }
    it { should be_running }
  end
end
