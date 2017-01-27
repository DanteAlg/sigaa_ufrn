WebMock.enable!

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.ignore_localhost = true
  c.hook_into :webmock # or :fakeweb, :excon
  c.default_cassette_options = { record: :once }
  c.ignore_hosts 'codeclimate.com' # para poder reportar coverage para CodeClimate
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  # pass `vcr: true` to an example to run it using VCR
  config.around(:each, vcr: true) do |example|
    name = example.metadata[:full_description].gsub(/\W+/, "_").split("_", 2).join("/")
    VCR.use_cassette(name, record: :once, match_requests_on: [:method, :host, :path]) { example.call }
  end

  config.around(:each, vcr_ignore_id: true) do |example|
    name = example.metadata[:full_description].gsub(/\W+/, "_").split("_", 2).join("/")
    VCR.use_cassette(name, record: :once, match_requests_on: [:method, :host]) { example.call }
  end
end
