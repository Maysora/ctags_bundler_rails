module CtagsBundlerRails
  class CtagsBundlerRails < Rails::Railtie
    railtie_name :ctags_bundler_rails

    rake_tasks do
      load "tasks/tasks.rake"
    end
  end
end