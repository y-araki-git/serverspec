require 'spec_helper'

describe '--- epel ----------------------------' do
  describe yumrepo('epel'), :if => os[:family] == 'redhat' do
    it { should exist }
  end

  describe yumrepo('epel'), :if => os[:family] == 'redhat' do
    it { should_not be_enabled }
  end
end

