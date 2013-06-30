require 'spec_helper'

describe package('jenkins') do
  it { should be_installed }
end

describe service('jenkins') do
  it { should be_enabled   }
  it { should be_running   }
end

[8080, 8081].each do |i|
  describe port(i) do
    it { should be_listening }
  end
end

describe file('/etc/sysconfig/jenkins') do
  it { should be_file }
end
