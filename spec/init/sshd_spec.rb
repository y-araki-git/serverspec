require 'spec_helper'

describe '--- sshd ----------------------------' do
  describe file('/etc/ssh/sshd_config') do
    its(:content) { should match /^PasswordAuthentication yes/ }
  end 
end 
