require 'spec_helper'

describe '--- timezone ----------------------------' do
  describe command('date') do
    its(:stdout) { should match /#{property[:timezone_abbr]}/ }
  end
end
