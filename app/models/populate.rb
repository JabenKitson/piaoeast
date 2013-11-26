require 'ffaker'
class Populate < ActiveRecord::Base
      
      def self.load_products
        run_file("products")
      end
      
      def self.load_assets
        run_file("assets")
      end
      
      def self.load_taxons
        run_file("taxons")
      end
      private
      
      def self.run_file(file)
       path = File.expand_path(samples_path + "#{file}.rb")
       # Check to see if the specified file has been loaded before
       if !$LOADED_FEATURES.include?(path)
         require path
         puts "Loaded #{file.titleize} data"
       end
      end
      
      def self.samples_path
        Pathname.new(File.join(File.dirname(__FILE__), '..', '..', 'db', 'load'))
      end
      
end
