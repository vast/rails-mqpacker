begin
  require 'sprockets/railtie'

  module RailsMqpacker
    class Railtie < ::Rails::Railtie
      initializer :setup_mqpacker, group: :all do |app|
        RailsMqpacker.install(app.assets)
      end
    end
  end
rescue LoadError
end
