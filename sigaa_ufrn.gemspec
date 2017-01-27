# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sigaa_ufrn/version'

Gem::Specification.new do |spec|
  spec.name          = "sigaa_ufrn"
  spec.version       = SigaaUfrn::VERSION
  spec.authors       = ["Dante Santos"]
  spec.email         = ["dante.alighierimds@gmail.com"]

  spec.summary       = "Integração com sistema SIGAA/UFRN"
  spec.description   = "Uma biblioteca para ajudar a criar novas integrações com o sistema do SIGAA da UFRN"
  spec.homepage      = "https://github.com/DanteAlg/sigaa_ufrn"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "vcr", "~> 3.0.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug", "~> 3.4"
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_dependency "typhoeus", "~> 1.1.2"
end
