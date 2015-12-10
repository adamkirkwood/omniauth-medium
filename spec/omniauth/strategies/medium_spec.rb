require 'spec_helper'

describe OmniAuth::Strategies::Medium do
  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  subject do
    OmniAuth::Strategies::Medium.new({})
  end

  context "client options" do
    it 'should have correct name' do
      expect(subject.options.name).to eq("medium")
    end

    it 'should have correct site' do
      expect(subject.options.client_options.site).to eq('https://api.medium.com/v1')
    end

    it 'should have correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://medium.com/m/oauth/authorize')
    end

    it 'should have correct token url' do
      expect(subject.options.client_options.token_url).to eq('https://api.medium.com/v1/tokens')
    end
  end
end
