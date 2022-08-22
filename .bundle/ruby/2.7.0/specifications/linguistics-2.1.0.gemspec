# -*- encoding: utf-8 -*-
# stub: linguistics 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "linguistics".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Granger".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDbDCCAlSgAwIBAgIBATANBgkqhkiG9w0BAQUFADA+MQwwCgYDVQQDDANnZWQx\nGTAXBgoJkiaJk/IsZAEZFglGYWVyaWVNVUQxEzARBgoJkiaJk/IsZAEZFgNvcmcw\nHhcNMTUwNDAxMjEyNDEzWhcNMTYwMzMxMjEyNDEzWjA+MQwwCgYDVQQDDANnZWQx\nGTAXBgoJkiaJk/IsZAEZFglGYWVyaWVNVUQxEzARBgoJkiaJk/IsZAEZFgNvcmcw\nggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDb92mkyYwuGBg1oRxt2tkH\n+Uo3LAsaL/APBfSLzy8o3+B3AUHKCjMUaVeBoZdWtMHB75X3VQlvXfZMyBxj59Vo\ncDthr3zdao4HnyrzAIQf7BO5Y8KBwVD+yyXCD/N65TTwqsQnO3ie7U5/9ut1rnNr\nOkOzAscMwkfQxBkXDzjvAWa6UF4c5c9kR/T79iA21kDx9+bUMentU59aCJtUcbxa\n7kcKJhPEYsk4OdxR9q2dphNMFDQsIdRO8rywX5FRHvcb+qnXC17RvxLHtOjysPtp\nEWsYoZMxyCDJpUqbwoeiM+tAHoz2ABMv3Ahie3Qeb6+MZNAtMmaWfBx3dg2u+/WN\nAgMBAAGjdTBzMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQWBBSZ0hCV\nqoHr122fGKelqffzEQBhszAcBgNVHREEFTATgRFnZWRARmFlcmllTVVELm9yZzAc\nBgNVHRIEFTATgRFnZWRARmFlcmllTVVELm9yZzANBgkqhkiG9w0BAQUFAAOCAQEA\nlUKo3NXePpuvN3QGsOLJ6QhNd4+Q9Rz75GipuMrCl296V8QFkd2gg9EG44Pqtk+9\nZac8TkKc9bCSR0snakp+cCPplVvZF0/gMzkSTUJkDBHlNV16z73CyWpbQQa+iLJ4\nuisI6gF2ZXK919MYLn2bFJfb7OsCvVfyTPqq8afPY+rq9vlf9ZPwU49AlD8bPRic\n0LX0gO5ykvETIOv+WgGcqp96ceNi9XVuJMh20uWuw6pmv/Ub2RqAf82jQSbpz09G\nG8LHR7EjtPPmqCCunfyecJ6MmCNaiJCBxq2NYzyNmluPyHT8+0fuB5kccUVZm6CD\nxn3DzOkDE6NYbk8gC9rTsA==\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2015-09-16"
  s.description = "Linguistics is a framework for building linguistic utilities for Ruby\nobjects in any language. It includes a generic language-independant\nfront end, a module for mapping language codes into language names, and\na module which contains various English-language utilities.".freeze
  s.email = ["ged@FaerieMUD.org".freeze]
  s.extra_rdoc_files = ["History.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.files = ["History.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.homepage = "http://deveiate.org/code/linguistics".freeze
  s.licenses = ["BSD".freeze]
  s.post_install_message = "This library also presents tie-ins for the 'linkparser' and\n'wordnet' libraries, which you can enable by installing the\ngems of the same name.".freeze
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "3.2.24".freeze
  s.summary = "Linguistics is a framework for building linguistic utilities for Ruby objects in any language".freeze

  s.installed_by_version = "3.2.24" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<loggability>.freeze, ["~> 0.11"])
    s.add_development_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
    s.add_development_dependency(%q<hoe-deveiate>.freeze, ["~> 0.7"])
    s.add_development_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
    s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_development_dependency(%q<linkparser>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<wordnet>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<wordnet-defaultdb>.freeze, ["~> 1.0"])
    s.add_development_dependency(%q<ruby-stemmer>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0"])
    s.add_development_dependency(%q<hoe>.freeze, ["~> 3.13"])
  else
    s.add_dependency(%q<loggability>.freeze, ["~> 0.11"])
    s.add_dependency(%q<hoe-mercurial>.freeze, ["~> 1.4"])
    s.add_dependency(%q<hoe-deveiate>.freeze, ["~> 0.7"])
    s.add_dependency(%q<hoe-highline>.freeze, ["~> 0.2"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<linkparser>.freeze, ["~> 1.1"])
    s.add_dependency(%q<wordnet>.freeze, ["~> 1.0"])
    s.add_dependency(%q<wordnet-defaultdb>.freeze, ["~> 1.0"])
    s.add_dependency(%q<ruby-stemmer>.freeze, ["~> 0.9"])
    s.add_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.13"])
  end
end
