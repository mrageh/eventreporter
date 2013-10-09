class Queue
  attr_reader :data

  def initialize
    @data = []
  end

  def count
    data.count
  end

  def add(items)
    @data += items
  end

  def clear
    @data.clear
  end

  def replace(data)
    clear && add(data)
  end
end
