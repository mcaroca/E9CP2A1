require 'date'

class Course
  attr_reader :name
  def initialize(name, *dates)
    @name = name
    @dates = dates.map{ |e| Date.parse(e) }
  end

end

file = File.open('cursos.txt', 'r')
data = file.readlines
file.close

courses = []
data.each do |info|
  ls = info.split(', ')
  courses << Course.new(*ls)
end
