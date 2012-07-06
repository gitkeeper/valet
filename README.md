# Valet Documentation - README

__Website__:        <http://gitkeeper.github.com/valet>  
__Git Repository__: <https://github.com/gitkeeper/valet/tree/gh-pages>  
__Author__:         Alexander Baumann  
__Copyright__:      2012  
__License__:        MIT License  
__Doc Version__:    0.0.2  
__Doc Date__:       03.07.2012

## Introduction

This is the public documentation for [Valet](https://github.com/gitkeeper/valet)
which is published as a [GitHub Project Page](http://gitkeeper.github.com/valet).

## Installation

After you have cloned this branch `gh-pages`, execute Bundler to install all the
necessary gems used for documenting:

    $ bundle

You also need to install [Pygments](http://pygments.org) in order for the syntax
highlighting to work on your development machine. Depending on your operating
system, the installation can vary. I recommend to read the section "Pygments" on
[Jekyll's installation page](https://github.com/mojombo/jekyll/wiki/install).

## Usage

### Working on Documentation

All documentation is written in
[GitHub Flavored Markdown](http://github.github.com/github-flavored-markdown/)
and saved as Markdown files (.md). Beware that only Markdown files with a
[YAML Front Matter](https://github.com/mojombo/jekyll/wiki/yaml-front-matter) at
the top are parsed through [Jekyll](https://github.com/mojombo/jekyll).
Because of that, you have all [Liquid](https://github.com/Shopify/liquid) tags
available in your Markdown files, plus some
[Jekyll specific ones](https://github.com/mojombo/jekyll/wiki/liquid-extensions).

### Compiling the Documentation

After you have modified any files you can check whether
[Jekyll](https://github.com/mojombo/jekyll) parses the whole documentation
correctly. __Always run Jekyll first before you commit or push!__

    $ jekyll

Alternatively you can use its server mode, which continuously parses the
documentation any time a file is modified:

    $ jekyll --server --auto

The documentation will then be available at <http://localhost:4000> by default.

## Contributing

If you'd like to help improving or extending the project's documentation, please
use separate feature of bugfix branches and create a new pull request:

1. [Fork it](https://github.com/gitkeeper/valet/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. [Create new pull request](https://github.com/gitkeeper/valet/pull/new/gh-pages)

## Copyright

Valet &copy; 2012 by Alexander Baumann. Valet is licensed under the MIT license.
Please see the [LICENSE](https://github.com/gitkeeper/valet/blob/master/LICENSE)
document for more information.
