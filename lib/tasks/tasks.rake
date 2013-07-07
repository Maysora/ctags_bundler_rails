namespace :ctags do
  desc 'Build tags for project files and gems in gemfile'
  task :all do
    %w(project gems).each do |t|
      Rake::Task["ctags:#{t}"].execute
    end
  end

  desc 'Build tags for project files'
  task :project do
    Dir.chdir Rails.root do
      system("ctags -R -f .tags .")
    end
  end

  desc 'Build tags for gems in gemfile'
  task :gems do
    Dir.chdir Rails.root do
      paths = Bundler.load.specs.reject{|s| s.name == 'rails_ctags_bundler'}.map(&:full_gem_path)
      system("ctags -R -f .gemtags #{paths.join(' ')}")

      if ENV['CTAGS_GEM_PATH'].present? && paths.present?
        current_gem_path = File.dirname(paths.first)
        if current_gem_path != ENV['CTAGS_GEM_PATH']
          original = File.read(".gemtags")
          if String.method_defined?(:encode)
            original.encode!('UTF-16', 'UTF-8', :invalid => :replace, :replace => '')
            original.encode!('UTF-8', 'UTF-16')
          else
            require 'iconv'
            ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
            original = ic.iconv(original)
          end
          File.open(".gemtags", "w"){|f| f.write original.gsub(current_gem_path, ENV["CTAGS_GEM_PATH"])}
        end
      end
    end
  end
end