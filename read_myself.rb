# This is a Ruby program that should be able to read itself, or other files you ask it to
@file_name = __FILE__

def read_file_contents
  puts "\nThe contents of the file #{@file_name} are:\n\n#{File.read(@file_name)}"
end

def get_existing_file
  loop do
    puts "\nPlease enter a file name to read, or type 'exit' to stop this program"
    @file_name = gets.chomp
    return if File.exist?(@file_name)
    exit if @file_name == "exit"
    puts "\nSorry, that file doesn't exist"
  end
end

def print_files
  loop do
    read_file_contents
    get_existing_file
  end
end

print_files
