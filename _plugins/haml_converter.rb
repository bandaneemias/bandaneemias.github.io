# module Jekyll
#   require 'haml'
#   class HamlConverter < Converter
#     safe true
#     priority :low

#     def matches(ext)
#       ext =~ /haml/i
#     end

#     def output_ext(ext)
#       ".html"
#     end

#     def convert(content)
#       engine = Haml::Engine.new(content)
#       engine.render
#     end
#   end

#   require 'sass'
#   class SassConverter < Converter
#     safe true
#     priority :low

#      def matches(ext)
#       ext =~ /sass/i
#     end

#     def output_ext(ext)
#       ".css"
#     end

#     def convert(content)
#       engine = Sass::Engine.new(content)
#       engine.render
#     end
#   end
# end

begin
  require 'haml'
rescue LoadError
  require 'rubygems'
  require 'haml'
  require 'jekyll_ext'
end

module Jekyll
  class Site
    def compile_haml_layouts
      Dir.glob(File.join(self.source, "_layouts/haml", "*.haml")).each do |f|
        begin
          origin = File.open(f).read
          result = Haml::Engine.new(origin).render
          raise HamlErrorException.new if result.empty?
          puts "Rendering #{f}"
          output_file_name = File.join("_layouts", File.basename(f, '.haml') + '.html')
          FileUtils.mkpath(File.dirname(output_file_name))
          File.open(output_file_name,'w') {|f| f.write(result)} if !File.exists?(output_file_name) or (File.exists?(output_file_name) and result != File.read(output_file_name))
        rescue HamlErrorException => e
        end
      end
    end
  end
  
  class HamlErrorException < Exception
  end
  
  AOP.around(Site, :read_layouts) do |site_instance, args, proceed, abort|
    site_instance.compile_haml_layouts
    # old_source = site_instance.source
    # site_instance.source = '_cache'
    result = proceed.call
    # site_instance.source = old_source
    result
  end
end