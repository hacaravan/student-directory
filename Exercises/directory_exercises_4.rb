# Rewriting the each in the name printing as while or until

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
  index = 0
  while index < students.length
    puts "#{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print_names(students)
print_footer(students)
