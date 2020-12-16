# In this exercise, we want to prompt the user for the cohort that each student is in
# We also need to check that that cohort is a valid one (for now assume all months are valid)

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  info_categories = [:name, :cohort]
  # Create empty array to be filled with students
  students = []
  while true do
    student_hash = Hash.new
    info_categories.each do |category|
      puts "Please enter the student's #{category} or press enter twice to skip"
      value = gets.chomp
      return students if category == :name && value.empty?
      next if value.empty?
      student_hash[category] = value
    end
    students << student_hash
    puts "Now we have #{students.length} students"
  end
end

def get_valid_cohort
  valid_cohorts = [:January, :February, :March, :April, :May, :June, :July,
                  :August, :September, :November, :December]
  cohort = String.new
  while !valid_cohorts.include?(cohort)
    puts "What cohort is this student in?"
    cohort = gets.chomp.capitalize.to_sym
  end
  cohort
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------------"
end

def print_names(students)
  students.each do |student|
    student.each do |category, value|
      if category == :name then puts "#{category.to_s.capitalize}: #{value}"
      else print "#{category.to_s.capitalize}: #{value}; "
      end
    end
    puts
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{students.length == 1 ? "" : "s"}"
end

get_valid_cohort

# students = input_students
# print_header
# print_names(students)
# print_footer(students)
