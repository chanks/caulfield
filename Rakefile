require "bundler"
Bundler.setup

#require "rspec/core/rake_task"
#Rspec::Core::RakeTask.new(:spec)

gemspec = eval(File.read("caulfield.gemspec"))

task :build => "#{gemspec.full_name}.gem"

file "#{gemspec.full_name}.gem" => gemspec.files + ["caulfield.gemspec"] do
  system "gem build caulfield.gemspec"
  system "gem install caulfield-#{Caulfield::VERSION}.gem"
end
