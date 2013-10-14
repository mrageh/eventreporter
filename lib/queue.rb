require "csv"

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

  def save_to(filename)
    directory = './data/'
    file_path = File.join(directory, filename)
    file = File.open(file_path, 'w'){|file| file.write(@data)}
  end

  def replace(data)
    clear && add(data)
  end

end
