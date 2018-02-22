require 'spec_helper'

describe '--- ldap ----------------------------' do
  describe package('nss-pam-ldapd'), :if => os[:family] == 'redhat' do
    it { should be_installed }
  end
  
  describe package('oddjob-mkhomedir'), :if => os[:family] == 'redhat' do
    it { should be_installed }
  end
  
  describe package('openldap-clients'), :if => os[:family] == 'redhat' do
    it { should be_installed }
  end
  
  describe service('oddjobd'), :if => os[:family] == 'redhat' do
    it { should be_enabled }
    it { should be_running }
  end
  
  describe service('nslcd') do
    it { should be_enabled }
    it { should be_running }
  end
  
  describe service('nscd') do
    it { should be_enabled }
    it { should be_running }
  end
  
  describe file('/etc/nslcd.conf') do
    its(:content) { should match /^uri ldap\:\/\/#{property[:ldapserver1]}/ }
    its(:content) { should match /^uri ldap\:\/\/#{property[:ldapserver2]}/ }
  end 
  
  describe file('/etc/nsswitch.conf'), :if => os[:family] == 'debian' do
    its(:content) { should match /^passwd:         compat ldap/ }
    its(:content) { should match /^group:          compat ldap/ }
    its(:content) { should match /^shadow:         compat ldap/ }
  end
end
