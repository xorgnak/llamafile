# frozen_string_literal: true

require_relative "llamafile/version"

require_relative "llamafile/llama"

module Llamafile
  class Error < StandardError; end

  attr_accessor :prompt

  def self.prompt
    LLAMA.prompt
  end

  def prompt
    Llamafile.prompt
  end
  
  def self.llama i
    LLAMA.post(LLAMA.prompt[:truth], { role: 'user', content: i })
  end

  def llama i
    Llamafile.llama i
  end
  
  def self.<< i
    Llamafile.llama i
  end
end
