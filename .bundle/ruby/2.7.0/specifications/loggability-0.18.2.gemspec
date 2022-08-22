# -*- encoding: utf-8 -*-
# stub: loggability 0.18.2 ruby lib

Gem::Specification.new do |s|
  s.name = "loggability".freeze
  s.version = "0.18.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://todo.sr.ht/~ged/Loggability/browse", "changelog_uri" => "https://deveiate.org/code/loggability/History_md.html", "documentation_uri" => "https://deveiate.org/code/loggability", "homepage_uri" => "https://hg.sr.ht/~ged/Loggability", "source_uri" => "https://hg.sr.ht/~ged/Loggability/browse" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Granger".freeze]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIID+DCCAmCgAwIBAgIBAzANBgkqhkiG9w0BAQsFADAiMSAwHgYDVQQDDBdnZWQv\nREM9RmFlcmllTVVEL0RDPW9yZzAeFw0yMDEyMjQyMDU1MjlaFw0yMTEyMjQyMDU1\nMjlaMCIxIDAeBgNVBAMMF2dlZC9EQz1GYWVyaWVNVUQvREM9b3JnMIIBojANBgkq\nhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAvyVhkRzvlEs0fe7145BYLfN6njX9ih5H\nL60U0p0euIurpv84op9CNKF9tx+1WKwyQvQP7qFGuZxkSUuWcP/sFhDXL1lWUuIl\nM4uHbGCRmOshDrF4dgnBeOvkHr1fIhPlJm5FO+Vew8tSQmlDsosxLUx+VB7DrVFO\n5PU2AEbf04GGSrmqADGWXeaslaoRdb1fu/0M5qfPTRn5V39sWD9umuDAF9qqil/x\nSl6phTvgBrG8GExHbNZpLARd3xrBYLEFsX7RvBn2UPfgsrtvpdXjsHGfpT3IPN+B\nvQ66lts4alKC69TE5cuKasWBm+16A4aEe3XdZBRNmtOu/g81gvwA7fkJHKllJuaI\ndXzdHqq+zbGZVSQ7pRYHYomD0IiDe1DbIouFnPWmagaBnGHwXkDT2bKKP+s2v21m\nozilJg4aar2okb/RA6VS87o+d7g6LpDDMMQjH4G9OPnJENLdhu8KnPw/ivSVvQw7\nN2I4L/ZOIe2DIVuYH7aLHfjZDQv/mNgpAgMBAAGjOTA3MAkGA1UdEwQCMAAwCwYD\nVR0PBAQDAgSwMB0GA1UdDgQWBBRyjf55EbrHagiRLqt5YAd3yb8k4DANBgkqhkiG\n9w0BAQsFAAOCAYEAMYegZanJi8zq7QKPT7wqXefX4C88I5JWeBHR3PvvWK0CwyMV\npeyiu5I13w/lYX+HUZjE4qsSpJMJFXWl4WZCOo+AMprOcf0PxfuJpxCej5D4tavf\nvRfhahSw7XJrcZih/3J+/UgoH7R05MJ+8LTcy3HGrB3a0vTafjm8OY7Xpa0LJDoN\nJDqxK321VIHyTibbKeA1hWSE6ljlQDvFbTqiCj3Ulp1jTv3TOlvRl8fqcfhxUJI0\n+5Q82jJODjEN+GaWs0V+NlrbU94cXwS2PH5dXogftB5YYA5Ex8A0ikZ73xns4Hdo\nXxdLdd92F5ovxA23j/rKe/IDwqr6FpDkU3nPXH/Qp0TVGv9zZnVJc/Z6ChkuWj8z\npW7JAyyiiHZgKKDReDrA2LA7Zs3o/7KA6UtUH0FHf8LYhcK+pfHk6RtjRe65ffw+\nMCh97sQ/Z/MOusb5+QddBmB+k8EicXyGNl4b5L4XpL7fIQu+Y96TB3JEJlShxFD9\nk9FjI4d9EP54gS/4\n-----END CERTIFICATE-----\n".freeze]
  s.date = "2020-12-28"
  s.description = "A composable logging system built on the standard Logger library.".freeze
  s.email = ["ged@faeriemud.org".freeze]
  s.homepage = "https://hg.sr.ht/~ged/Loggability".freeze
  s.licenses = ["BSD-3-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.24".freeze
  s.summary = "A composable logging system built on the standard Logger library.".freeze

  s.installed_by_version = "3.2.24" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake-deveiate>.freeze, ["~> 0.7"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.7"])
    s.add_development_dependency(%q<configurability>.freeze, ["~> 4.0"])
    s.add_development_dependency(%q<timecop>.freeze, ["~> 0.9"])
    s.add_development_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0.4"])
    s.add_development_dependency(%q<concurrent-ruby>.freeze, ["~> 1.1"])
  else
    s.add_dependency(%q<rake-deveiate>.freeze, ["~> 0.7"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.7"])
    s.add_dependency(%q<configurability>.freeze, ["~> 4.0"])
    s.add_dependency(%q<timecop>.freeze, ["~> 0.9"])
    s.add_dependency(%q<rdoc-generator-fivefish>.freeze, ["~> 0.4"])
    s.add_dependency(%q<concurrent-ruby>.freeze, ["~> 1.1"])
  end
end
