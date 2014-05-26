require 'pathname'
require 'execjs'

module RailsMqpacker
  class Processor
    def self.process(css)
      processor.call('process', css)
    end

    private

    def self.processor
      @@processor ||= ExecJS.compile(processor_js)
    end

    def self.processor_js
      [mqpacker_js, process_proxy].join(';')
    end

    def self.mqpacker_js
      @@mqpacker_js ||= Pathname(__FILE__).join('../../../vendor/mqpacker.js').read
    end

    def self.process_proxy
      "var mqpacker = require('mqpacker');
       var process = function(css) { return mqpacker.pack(css).css; }"
    end
  end
end
