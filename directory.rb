
@students = []

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # get first name
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end

def print_names
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_names
  print_footer
end

def process(selection)
  case selection
  when "1" then
    input_students
  when "2" then
    show_students
  when "9" then
    exit
  else
    puts "I didn't catch that, please try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
# students = input_students
# print_header
# print_names(students)
# print_footer(students)
