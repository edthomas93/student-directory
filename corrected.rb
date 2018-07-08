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
  puts "3. Save the list"
  puts "4. Load desired list"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      puts "Enter desired filename or hit enter to save to students.csv"
      savename = STDIN.gets.chomp
      if savename.empty?
        save_students
      else
        save_students(savename)
      end
    when "4"
      puts "Enter desired filename or hit enter to load students.csv"
      loadname = STDIN.gets.chomp
      if loadname.empty?
        load_students
      else
        load_students(loadname)
      end
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
  file = File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      push_students(name, cohort)
    end
  end
  puts "Loaded students successfully!"
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

def save_students(filename = "students.csv")
  #open the file for writing
  file = File.open(filename, "w") do |file|
    #iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Student list saved!"
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
