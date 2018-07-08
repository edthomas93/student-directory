@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def push_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
  # add the student hash to the array
    push_students(name, cohort)
    puts "Now we have #{@students.count} students"
  # get another name from the user
    name = STDIN.gets.chomp
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    push_students(name, cohort)
  end
  file.close
end

def show_students
  print_header
  print_students
  print_footer
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students
  if @students.length == 0
    puts "There are no students to list"
  else
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer
  if @students.length == 0
    puts "There are no students (yet)"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    load_students
  elsif File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
