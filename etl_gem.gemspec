Gem::Specification.new do |spec|
  spec.name = 'etl_gem'
  spec.version = '0.1.0'
  spec.date = '2019-07-19'
  spec.summary = %q{etl_gem serves ETL data using LightService}
  spec.files = [
    'spec/*'
  ]
  spec.require_paths = ['lib']
  spec.authors = ['core2juan']

  spec.add_dependency 'light-service', '~> 0.12.0'
  spec.add_development_dependency "rspec"
end
