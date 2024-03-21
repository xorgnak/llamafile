# frozen_string_literal: true

require_relative "llamafile/version"

require_relative "llamafile/llama"

module Llamafile
  class Error < StandardError; end
  def self.llama i
    Llama.new().process(i)
  end
  def llama i
    Llamafile.process(i) 
  end
end
