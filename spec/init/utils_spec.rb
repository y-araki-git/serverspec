require 'spec_helper'

describe '--- utils_spec ----------------------------' do
  %w{ curl unzip jq git telnet sysstat dstat }.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  %w{ dnsutils debian-goodies }.each do |pkg|
    describe package(pkg), :if => os[:family] == 'debian' do
      it { should be_installed }
    end
  end

  %w{ bind-utils }.each do |pkg|
    describe package(pkg), :if => os[:family] == 'redhat' do
      it { should be_installed }
    end
  end
end

