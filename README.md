# ctags_bundler_rails

CTags builder rake task for rails project.

Originally used for [Sublime Text 2](http://sublimetext.com) with [CTags package](https://github.com/SublimeText/CTags).

## Requirements

* [Exuberant CTags](http://ctags.sourceforge.net)

## Installation

Add to ```Gemfile```

    gem 'ctags_bundler_rails', :git => 'git://github.com/Maysora/ctags_bundler_rails.git', :group => :development

## Usage

    rake ctags:project # generate .tags for the project
    rake ctags:gems    # generate .gemtags for all gems in gemfile
    rake ctags:all     # generate both .tags and .gemtags
    
It's also possible to specify tags filename, for example:

    rake ctags:project filename=project.tags
    rake ctags:gems filename=gems.tags
    rake ctags:all filename=all.tags