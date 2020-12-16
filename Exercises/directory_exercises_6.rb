# In this exercise we want to center our output
def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # Create empty array to be filled with students
  students = []
  # get first name
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header(width)
  puts "The students of Villains Academy".center(width)
  puts "-------------------".center(width)
end

def print_names(students, width)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(width)
  end
end

def print_footer(students, width)
  puts "Overall, we have #{students.count} great students".center(width)
end

students = input_students
max_width = students.map { |student| "#{student[:name]} (#{student[:cohort]} cohort)".length }.max
max_width = [max_width, "The students of Villains Academy".length].max
print_header(max_width)
print_names(students, max_width)
print_footer(students, max_width)
