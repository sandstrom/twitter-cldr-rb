# encoding: UTF-8

module TwitterCldr
  module Shared
    class UnicodeData
      @@blocks = TwitterCldr.resources.resource_for("unicode_data", "blocks")

      class << self
        def for_code_point(code_point)
          #Find the target block
          blocks = TwitterCldr.resources.resource_for("unicode_data", "blocks")
          target = blocks.find do |block_name, range|
            range.cover? code_point.to_i(16)
          end 

          TwitterCldr.resources.resource_for("unicode_data", target.first)[code_point.to_sym] if target
        end     
      end
    end
  end
end