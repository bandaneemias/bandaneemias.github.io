desc "Parse haml layouts"
task :parse_haml do
  print "Parsing Haml layouts..."
  # system(%{
  #   cd _layouts/haml &&
  #   for f in *.haml; do [ -e $f ] && haml $f ../${f%.haml}.html; done
  #    "watcher -o _layouts _layouts/haml"
  #    "scss --watch css/sass/main.scss:css/main.css"
  #    "coffee -b -w -o js -c js/coffee/*.coffee"
  # })
  pids = [
    # spawn("jekyll"), # put `auto: true` in your _config.yml
    # spawn("watcher -o _layouts _layouts/haml"),
    spawn("scss --watch css/sass/main.scss:css/main.css"),
    spawn("coffee -b -w -o js -c js/coffee/*.coffee")
  ]
  puts "done."
end

desc "Launch preview environment"
task :dev do
  Rake::Task["parse_haml"].invoke
  system "jekyll serve --watch"
end

desc "Launch preview environment"
task :default do
  system "jekyll serve --watch"
end