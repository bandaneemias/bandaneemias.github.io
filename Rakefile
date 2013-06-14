desc "Parse haml layouts"
task :parse_haml do
  print "Parsing Haml layouts..."
  system(%{
    cd _layouts/haml && 
    for f in *.haml; do [ -e $f ] && haml $f ../${f%.haml}.html; done
  })
  pids = [
    # spawn("jekyll"), # put `auto: true` in your _config.yml
    spawn("scss --watch css/sass:css"),
    spawn("coffee -b -w -o js -c js/coffee/*.coffee")
  ]
  puts "done."
end

desc "Launch preview environment"
task :default do
  Rake::Task["parse_haml"].invoke
  system "jekyll serve --watch"
end