# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{prohax}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nick Partridge"]
  s.date = %q{2008-12-10}
  s.description = %q{}
  s.email = ["nkpart@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "coverage/index.html", "coverage/lib-prohax-box_rb.html", "coverage/lib-prohax-either_rb.html", "coverage/lib-prohax-let_in_rb.html", "coverage/lib-prohax-metaclass_rb.html", "coverage/lib-prohax-strucked_rb.html", "coverage/lib-prohax_rb.html", "lib/prohax.rb", "lib/prohax/box.rb", "lib/prohax/either.rb", "lib/prohax/let_in.rb", "lib/prohax/metaclass.rb", "lib/prohax/patches/enumerable.rb", "lib/prohax/patches/symbol.rb", "lib/prohax/strucked.rb", "prohax.gemspec", "script/console", "script/destroy", "script/generate", "spec/box_spec.rb", "spec/either_spec.rb", "spec/let_in_syntax_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "spec/strucked_spec.rb", "tasks/rspec.rake", "test_gem.sh"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/nkpart/prohax}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{prohax}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
