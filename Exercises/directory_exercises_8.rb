# In this exercise, we want to prompt the user for the cohort that each student is in
# We also need to check that that cohort is a valid one (for now assume all months are valid)
# Then at the end, we print the students grouped by cohort

def input_students
  # Create empty array to be filled with students
  students = []
  while true do
    student_hash = Hash.new
    puts "Please enter the name of the next student"
    puts "To finish, just hit return"
    name = gets.chomp
    return students if name.empty?
    student_hash[:name] = name
    student_hash[:cohort] = get_valid_cohort
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
  puts "Grouped by cohort, the students are:"
end

def print_names(grouped_students)
  grouped_students.each do |cohort|

  end
end

def group_students_by_chort(students)
  cohorts_used = students.map{ |student| student[:cohort]}.uniq
  grouped_students = {}
  cohorts_used.each do |cohort|
    cohort_students = students.select{ |student| student[:cohort] == cohort}
    grouped_students[cohort] = cohort_students.map { |student| student[:name]}
  end
  p grouped_students
end

def print_footer(students)
  puts "Overall, we have #{students.count} great student#{students.length == 1 ? "" : "s"}"
end

students = input_students
group_students_by_chort(students)
# print_header
# print_names(students)
# print_footer(students)
