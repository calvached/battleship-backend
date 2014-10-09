RSpec.configure do |config|
  config.include WebMock::API

  config.before(:each) do
    MyClient.base_url = 'http://www.example.com'
    stub_request(:any, /www.example.com/).to_rack(MyService)
  end
end
