require 'spec_helper'

describe '--- editor ----------------------------' do
  describe command('update-alternatives --display editor | grep vim.tiny'), :if => os[:family] == 'debian' do
    its(:stdout) { should match /^\/usr\/bin\/vim.tiny - priority 10/ }
  end
end
