require 'spec_helper'

describe '--- history ----------------------------' do
  describe file('/etc/profile.d/history.sh') do
    its(:content) { should match /^export HISTTIMEFORMAT\=\'\%F \%T \'/ }
    its(:content) { should match /^export HISTSIZE\=10000/ }
    its(:content) { should match /^export HISTFILESIZE\=10000/ }
  end 
end 

