require 'spec_helper'

describe 'wade::install_httpd' do


  let(:chef_run) { ChefSpec::SoloRunner.new(
    platform: 'centos',
    version: '6.8',
    step_into: ['httpd_config']
  ).converge('wade::install_httpd') }


  before do
    allow(Chef::Platform::ServiceHelpers).to receive(:service_resource_providers).and_return(
      [:redhat]
    )
  end

  
end
