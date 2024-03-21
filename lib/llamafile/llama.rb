
class Llama
  attr_accessor :depth, :context, :batch
  def initialize
    @i = []
    @o = []
    @context = 2048
    @batch = 128
    @depth = 1
  end
  def args
    %[-c #{@context} -b #{@batch}]
  end
  def llama i
    `llama #{args} -p "#{i}" 2> /dev/null`.strip.gsub(i,"").strip
  end
  def trim i,o
    @i << i
    @o << o
    [@i,@o].each { |e| if e.length > @depth; e.shift; end; }
  end
  def process k
    o = llama(%[#{k}\n])
    if o != nil
      trim p, o
    end
    if "#{o}".length == 0
      o = "I don't know."
    end
    return { input: k, output: o }
  end
end

