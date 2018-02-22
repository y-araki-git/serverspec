require 'spec_helper'

describe '--- selinux ----------------------------' do
  describe selinux, :if => os[:family] == 'redhat' do
    it { should be_disabled }
  end
end
