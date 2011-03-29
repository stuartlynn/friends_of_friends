# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{friends_of_friends}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Stuart Lynn"]
  s.date = %q{2011-03-29}
  s.description = %q{gem for clusting using fof algorithm }
  s.email = %q{stuart@zooniverse.org}
  s.extra_rdoc_files = ["README.rdoc", "lib/friends_of_friends.rb"]
  s.files = ["Manifest", "README.rdoc", "Rakefile", "lib/friends_of_friends.rb", "friends_of_friends.gemspec"]
  s.homepage = %q{http://github.com/stuarlynn/friends_of_friends}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Friends_of_friends", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{friends_of_friends}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{gem for clusting using fof algorithm}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
