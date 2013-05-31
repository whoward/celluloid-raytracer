# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', :env => {'JRUBY_OPTS' => "--client", 'JAVA_OPTS' => '-client'}, :cli => "--color" do
  watch(%r{^spec/.+_spec\.rb$}) { "spec" }
  watch(%r{^app/(.+)\.rb$})     { "spec" }
  watch(%r{^lib/(.+)\.rb$})     { "spec" }
  watch('spec/spec_helper.rb')  { "spec" }
end

