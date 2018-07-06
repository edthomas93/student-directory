def center(string)
  puts string.center(80)
end

def input_students
  puts "Please enter the student's name"
  #create an empty array
  students= []
  #get the first name
  name = gets.chomp
  #get the hobbies of students
  puts "Please enter the student's hobby"
  hobby = gets.chomp
  #get the cohort of students
  puts "Please enter the student's cohort"
  cohort = gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, hobby: hobby, cohort: cohort}
    puts "Now we have #{students.count} students, type another name to input another student or hit enter to stop"
    #get another name from the user
    name = gets.chomp
      if name.empty?
        break
      end
    puts "Please enter the student's hobby"
    hobby = gets.chomp
    puts "Please enter the student's cohort"
    cohort = gets.chomp
  end
  #return the array of students
  students
end
def print_header
  center("The students of Villains Academy")
  center("-------------")
end
def print(students)
  index = 0
  while index < students.length
    center("#{students[index][:name]} likes #{students[index][:hobby]} and is in the #{students[index][:cohort]} cohort")
    index +=1
#  students.each_with_index do |student, index|
#    puts "#{index.to_i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  center("Overall, we have #{names.count} great students")
end
def first_letter(students)
  puts "What letter do the names you want to view begin with?"
  letter = gets.chomp
  students.each do |student|
    if student[:name].start_with?(letter)
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
def print_length(students)
  puts "What is the maximum number of charcaters in the names you wish to view?"
  max_length = gets.chomp.to_i
  students.each do |student|
    if student[:name].length <= max_length
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end
#nothing happens until we call the methods
students = input_students
print_header
#print_length(students) #Exercise 3
print(students)
#first_letter(students) #Exercise 2
print_footer(students)
