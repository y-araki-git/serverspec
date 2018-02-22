require 'spec_helper'

describe '--- logrotate ----------------------------' do
  describe file('/etc/logrotate.d/rsyslog'), :if => os[:family] == 'debian' do
    its(:content) { should match "/var/log/syslog\n{\n *rotate 30\n *daily\n" }
  end
end
