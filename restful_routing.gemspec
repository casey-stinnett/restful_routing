# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'restful_routing/version'

Gem::Specification.new do |spec|
  spec.name          = "restful_routing"
  spec.version       = RestfulRouting::VERSION
  spec.authors       = ["Casey Stinnett"]
  spec.email         = ["stinnett.casey@gmail.com"]

  spec.summary       = %q{Auto-generate a restful_routing file for easy prefix tracking.}
  spec.description   = %q{
    While developing Rails apps, it is often difficult to remember which prefixes route to which controller#action. That is why it is useful to run `rake routes` (or `rails routes` in Rails 5) and put that output in a file for later reference. This gem does that for you.

    After installing the gem in your Rails project, it is listening for saved changes in your `config/routes.rb`. Every time you make a change to routes.rb and you save it, restful_routing will look for `restful_routing.rb` in your root directory. It will update it if there or make it if not.

    `restful_routing.rb` will contain the output of `rake routes` or `rails routes`.

  }
  spec.homepage      = "https://github.com/casey-stinnett/restful_routing"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "listen", "~> 3.0"
end
