require 'spec_helper'

describe '--- zabbix ----------------------------' do
  describe package('zabbix-agent'), :if => os[:family] == 'redhat' do
    it { should be_installed.with_version('2.4') }
  end
  
  describe package('zabbix-agent') do
    it { should be_installed }
  end
  
  describe service('zabbix-agent') do
    it { should be_enabled }
    it { should be_running }
  end
  
  zabbix_conf = %W(
    Server=#{property[:zabbixserver1]},#{property[:zabbixserver2]}
    ServerActive=#{property[:zabbixserver1]},#{property[:zabbixserver2]}
    Hostname=#{host_inventory['hostname']}
    AllowRoot=1
    RefreshActiveChecks=120
    EnableRemoteCommands=1
  )
  
  zabbix_conf.each do |conf|
    describe file('/etc/zabbix/zabbix_agentd.conf') do
      its(:content) { should match /^#{conf}/ }
    end 
  end
end

