
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

def get_letter
  while true do
    puts "Please enter a single letter, or press enter to ignore"
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

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
let = get_letter
puts let == nil ? "No letter given" : let

# students = input_students
# print_header
# print_names(students)
# print_footer(students)
