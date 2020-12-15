# Enter a list of students, and then return a list of all those whose name is
# shorter than 12 characters

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

def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end

def print_names(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students, filtered_students, max_length)
  puts "Overall, we have #{students.length} great students"
  puts "Of these, #{filtered_students.length} have a name with less than #{max_length} characters"
end

def filter_names_by_length(students, max_length)
  students.select{ |student| student[:name].length <= max_length }
end

max_length = 12
students = input_students
filtered_students = filter_names_by_length(students, max_length)
print_header
print_names(filtered_students)
print_footer(students, filtered_students, max_length)
