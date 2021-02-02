require_relative 'lib/Cleveland_Museum_of_Art_CLI/version'

Gem::Specification.new do |spec|
  spec.name          = "Cleveland_Museum_of_Art_CLI"
  spec.version       = ClevelandMuseumOfArtCLI::VERSION
  spec.authors       = ["breannams"]
  spec.email         = ["breannamarie_s@hotmail.com"]

  spec.summary       = "cleveland museum of art gem"
  spec.description   = "cleveland museum of art gem"
  spec.homepage      = "https://github.com/breannams/Cleveland_Museum_of_Art_CLI"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/breannams/Cleveland_Museum_of_Art_CLI"

  spec.metadata["homepage_uri"] = "https://github.com/breannams/Cleveland_Museum_of_Art_CLI"
  spec.metadata["source_code_uri"] = "https://github.com/breannams/Cleveland_Museum_of_Art_CLI"
  spec.metadata["changelog_uri"] = "https://github.com/breannams/Cleveland_Museum_of_Art_CLI"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "httparty"
  spec.add_development_dependency "colorize"
  
end
