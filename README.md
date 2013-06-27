# ctags_bundler_rails

CTags builder rake task for rails project.

Originally used for [Sublime Text 2](http://sublimetext.com) with [CTags package](https://github.com/SublimeText/CTags).

## Requirements

* [Exuberant CTags](http://ctags.sourceforge.net)

## Installation

Add to ```Gemfile```

    gem 'ctags_bundler_rails', :group => :development

## Usage

    rake ctags:project # generate .tags for the project
    rake ctags:gems    # generate .gemtags for all gems in gemfile
    rake ctags:all     # generate both .tags and .gemtags
    
It's also possible to change gem path to somewhere else, for example:

    rake ctags:all CTAGS_GEM_PATH=C:/your-awesome-ruby-dir/lib/ruby/gems/1.9.1/gems