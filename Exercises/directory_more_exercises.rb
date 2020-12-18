# Exercise 1 - added add_student method to avoid repeating code
# Exercise 2 - load students.csv by default if no file is given on start up

@students = []
@default_file = "students.csv"
@options_hash = {"1" => "Input students", "2" => "Show students",
                "3" => "Save student list",
                "4" => "Load student list", "9" => "Exit"}

def get_cohort
  valid_cohorts = [:january ,:february ,:march ,:april ,:may ,:june ,:july,
                  :august ,:september ,:october ,:november ,:december]
  cohort = ""
  while !valid_cohorts.include?(cohort)
    puts "What cohort is this student in?"
    cohort = STDIN.gets.chomp.downcase.to_sym
  end
  cohort
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # get first name
  name = STDIN.gets.chomp
  while !name.empty? do
    cohort = get_cohort
    add_student(name, cohort)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def print_header
  puts "\nThe students of Villains Academy"
  puts "-------------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
  puts
end

def print_footer
  puts "Overall, we have #{@students.count} great students\n"
end

def get_file_name
  puts "Please enter the file name you would like to use"
  gets.chomp
end

def print_menu
  puts "\nChoose an option to do it:"
  @options_hash.each {|number, action| puts "#{number}. #{action}"}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  if !@options_hash.keys.include? selection then puts "I didn't catch that, please try again"
  else
    case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students(get_file_name)
    when "9" then exit
    end
    puts "You successfully did option #{selection} - #{@options_hash[selection]}"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open(get_file_name, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(file_name = @default_file)
  file = File.open(file_name, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_student(name, cohort.to_sym)
  end
  file.close
end

def startup_load_students
  file_name = ARGV.first
  if file_name.nil?
    load_students
  elsif File.exists?(file_name)
    load_students(file_name)
    puts "Loaded #{@students.length} from #{file_name}"
  else
    puts "Sorry, the file '#{file_name}' doesn't exist"
    exit
  end
end


startup_load_students
interactive_menu
