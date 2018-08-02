class Table
  attr_reader :name, :days
  
  def initialize(name, *days)
    @name = name
    @days = days
  end

  def max
    self.days.max
  end

  def max_index
    self.days.each_with_index.max[1]
  end

  def sum
    self.days.inject(0.0) { |sum, el| sum + el.to_i }
  end

end

file = File.open('casino.txt', 'r')
data = file.readlines
file.close

casino = []
data.each do |line|
  ls = line.split(', ')
  casino << Table.new(*ls)
end

casino.each do |table|
  puts "En #{table.name} el valor máximo es: #{table.max}, el día #{table.max_index + 1}" 
end

total_diario = 0
total_elements = 0
casino.each do |table|
  total_diario += table.sum
  total_elements += table.days.size
end

puts "El promedio de todos los elementos es #{total_diario / total_elements}" 