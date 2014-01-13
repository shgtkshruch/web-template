# Require any additional compass plugins here.

# A simple and lightweight mixin library for Sass.
# http://bourbon.io/
require "bourbon"

# Adds glob-based imports to Sass
# https://github.com/chriseppstein/sass-globbing
# require "sass-globbing"

# SassyLists is a Compass Extension
# http://sassylists.com/
require "SassyLists"

# Responsive grids for Compass.
# http://susy.oddbird.net/
# require "susy"

# A lightweight semantic grid framework
# for Sass and Bourbon
# http://neat.bourbon.io/
# require "neat"

# bootstrap-sass
# Official port of Bootstrap to Sass, ready to roll.
# https://github.com/twbs/bootstrap-sass
# require "bootstrap-sass"

# Set this to the root of your project when deployed:
http_path = "htdocs"
css_dir = "htdocs/css"
sass_dir = "develop/sass"
images_dir = "htdocs/img"
javascripts_dir = "htdocs/js"

# You can select your preferred output style here (can be overridden via the command line):
output_style = :expanded
# or :nested or :compact or :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
line_comments = false

# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

asset_cache_buster :none
