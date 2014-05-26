require_relative 'rails-mqpacker/version'
require_relative 'rails-mqpacker/processor'

module RailsMqpacker
  autoload :Sprockets, 'rails-mqpacker/sprockets'

  def self.install(assets)
    Sprockets.new(Processor).install(assets)
  end
end
