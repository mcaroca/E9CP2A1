require 'date'

class Course
  attr_reader :name
  def initialize(name, *dates)
    @name = name
    @dates = dates
  end

  def after date_for_compare
    raise ArgumentError.new('argument is not a date') if date_for_compare.class != Date 
    @dates.select{ |date| Date.parse(date) < date_for_compare }
  end

  def before date_for_compare
    raise ArgumentError.new('argument is not a date') if date_for_compare.class != Date 
    @dates.select{ |date| Date.parse(date) > date_for_compare }
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

courses.each do |course|
  puts "Cursos previos: #{course.name} #{course.after(Date.today)} \nCursos posteriores: #{course.name} #{course.before(Date.today)}"
end