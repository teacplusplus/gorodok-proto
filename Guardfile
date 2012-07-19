# Guardfile by Anton Baronov (anton.baronov@gmail.com)

guard 'spork', :wait => 60, :rspec => true, :cucumber => false, :bundler => false, :test_unit => false, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('db/seeds.rb')
  watch('db/schema.rb')
  watch('config/environment.rb')
  watch(%r{^config/environments/.+.rb$})
  watch(%r{^config/initializers/.+.rb$})
  watch('spec/spec_helper.rb')
end

guard 'rspec', :bundler => false, :cli => '--drb', :version => 2 do
  watch(%r{^spec/.+_spec.rb$})
  watch(%r{^lib/(.+).rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^spec/.+_spec.rb$})
  watch(%r{^app/(.+).rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+).rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller).rb$})  { |m| "spec/requests" }
  watch(%r{^spec/support/(.+).rb$})                  { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('config/routes.rb')                           { "spec/requests" }
  watch('app/controllers/application_controller.rb')  { "spec/requests" }
  # Capybara request specs
  watch(%r{^app/views/(.+)/.*.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
end
