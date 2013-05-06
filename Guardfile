# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch(%r{^app/.+\.rb$})
  watch('spec/dummy/config/application.rb')
  watch('spec/dummy/config/environment.rb')
  watch('spec/dummy/config/environments/test.rb')
  watch(%r{^spec/dummy/config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch(%r{spec/support/}) { :rspec }
  watch(%r{^spec/dummy/app/.+\.rb$})
  watch(%r{^lib/.+\.rb$})
end
