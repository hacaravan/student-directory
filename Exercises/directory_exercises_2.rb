
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

def get_starting_letter
  while true do
    puts "Please enter a single letter that each name should start with, or press enter to ignore"
    letter = gets.chomp
    return letter if letter.length == 1
    return nil if letter.empty?
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end

def print_names(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_names_starting_with(students, initial)
  students.each_with_index do |student, index|
    if student[:name].downcase.chr == initial.downcase
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def print_footer_starting_with(students, initial, initial_count)
  puts "Overall, we have #{students.count} great students"
  puts "Of those, #{initial_count} have a name starting with #{initial}"
end

def print_names_and_footer(students, initial)
  if initial.nil?
    print_names(students)
    print_footer(students)
  else
    student_initial_count = students.select{ |student| student[:name].chr.downcase == initial.downcase }.length
    print_names_starting_with(students, initial)
    print_footer_starting_with(students, initial, student_initial_count)
  end
end

students = input_students
initial = get_starting_letter
print_header
print_names_and_footer(students, initial)
