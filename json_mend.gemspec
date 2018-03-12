
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "json_mend/version"

Gem::Specification.new do |spec|
  spec.name          = "json_mend"
  spec.version       = JsonMend::VERSION
  spec.authors       = ["Richard Newman"]
  spec.email         = ["richard@newmanworks.com"]

  spec.summary       = %q{Attempts to repair JSON strings with poor syntax}
  spec.description   = %q{Repairs basic syntactic issues and normalizes JSON strings for later parsing.}
  spec.homepage      = "https://github.com/rdnewman/json_mend"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'oj', '~> 3.0'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
