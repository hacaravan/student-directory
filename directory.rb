
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

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def interactive_menu
  students = []
  loop do
    # 1. Print the menu and ask the user what they want to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. Take the input from the user and save it as a variable
    selection = gets.chomp
    # 3. Do what the user has asked us to do
    case selection
    when "1" then
      students = input_students
    when "2" then
      print_header
      print_names(students)
      print_footer(students)
    when "9" then
      exit
    else
      puts "I didn't catch that, please try again"
    end
  end
end

interactive_menu
# students = input_students
# print_header
# print_names(students)
# print_footer(students)
