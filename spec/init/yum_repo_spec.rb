require 'spec_helper'

describe '--- yum_repo  ----------------------------' do
  describe file('/etc/yum.repos.d/CentOS-Base.repo'), :if => os[:family] == 'redhat' do
    its(:content) { should match /baseurl=http:\/\/#{property[:centos_repo]}\/centos\/\$releasever\/os\/\$basearch\// }
    its(:content) { should match /baseurl=http:\/\/#{property[:centos_repo]}\/centos\/\$releasever\/updates\/\$basearch\// }
  end 
end 

