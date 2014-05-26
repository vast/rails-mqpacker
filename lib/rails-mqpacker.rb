require_relative 'rails-mqpacker/version'
require_relative 'rails-mqpacker/processor'
require_relative 'rails-mqpacker/railtie' if defined?(Rails)

module RailsMqpacker
  autoload :Sprockets, 'rails-mqpacker/sprockets'

  def self.install(assets)
    Sprockets.new(Processor).install(assets)
  end
end
