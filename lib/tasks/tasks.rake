namespace :ctags do
  desc 'Build tags for project files and gems in gemfile'
  task :all do
    paths = Bundler.load.specs.reject{|s| s.name == 'rails_ctags_bundler'}.map(&:full_gem_path)
    paths << Rails.root unless ENV['filename'].nil?
    Dir.chdir Rails.root do
      system("ctags -R -f #{ENV['filename'] || '.gemtags'} #{paths.join(' ')}")
      system("ctags -R -f .tags #{Rails.root}") if ENV['filename'].nil?
    end
  end

  desc 'Build tags for project files'
  task :project do
    Dir.chdir Rails.root do
      system("ctags -R -f #{ENV['filename'] || '.tags'} #{Rails.root}")
    end
  end

  desc 'Build tags for gems in gemfile'
  task :gems do
    Dir.chdir Rails.root do
      paths = Bundler.load.specs.reject{|s| s.name == 'rails_ctags_bundler'}.map(&:full_gem_path)
      system("ctags -R -f #{ENV['filename'] || '.gemtags'} #{paths.join(' ')}")
    end
  end
end