require 'spec_helper'

describe '--- apt_source ----------------------------' do
  describe file('/etc/apt/sources.list'), :if => os[:family] == 'debian' do
    its(:content) { should match /^deb http:\/\/#{property[:debian_repo]}\/debian jessie main contrib non-free\ndeb http:\/\/#{property[:debian_repo]}\/debian jessie\/updates main contrib non-free/ }
  end 
  
  describe command('apt-key list'), :if => os[:family] == 'debian' do
    its(:stdout) { should match /^uid +Repository/ }
  end
  
  describe command('dpkg -l | grep zabbix-release'), :if => os[:family] == 'debian' do
    its(:stdout) { should match /zabbix-release +2\.4-1\+jessie/ }
  end
end

