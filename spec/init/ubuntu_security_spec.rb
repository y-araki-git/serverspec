require 'spec_helper'

describe '--- ubuntu_security  ----------------------------' do
  describe file('/etc/default/grub'), :if => os[:family] == 'ubuntu' do
    its(:content) { should match /^GRUB_CMDLINE_LINUX=\"apparmor=0\"/ }
  end 
  
  describe file('/etc/apt/apt.conf.d/50unattended-upgrades'), :if => os[:family] == 'ubuntu' do
    its(:content) { should match /^\/\/\t\"\${distro_id}:\${distro_codename}-security\";/ }
  end 
  
  describe file('/etc/apt/apt.conf.d/20auto-upgrades'), :if => os[:family] == 'ubuntu' do
    its(:content) { should match /^APT::Periodic::Update-Package-Lists \"0\";/ }
  end 
  
  describe file('/etc/apt/apt.conf.d/20auto-upgrades'), :if => os[:family] == 'ubuntu' do
    its(:content) { should match /^APT::Periodic::Unattended-Upgrade \"0\";/ }
  end 
  
  describe command('systemctl is-enabled apt-daily.service'), :if => os[:family] == 'ubuntu' do
    its(:stdout) { should match /^static/ }
  end
  
  describe command('systemctl is-enabled apt-daily.timer'), :if => os[:family] == 'ubuntu' do
    its(:stdout) { should match /^disabled/ }
  end
  
  describe service('apt-daily'), :if => os[:family] == 'ubuntu' do
    it { should_not be_running }
  end
end

