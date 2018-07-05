def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students= []
  #get the first name
  name = gets.chomp
  #while the name is not empty repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name,  cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
  index = 0
  while index < students.length
    puts "#{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index +=1
#  students.each_with_index do |student, index|
#    puts "#{index.to_i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
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
puts students.length
print_header
#print_length(students) #Exercise 3
print(students)
#first_letter(students) #Exercise 2
print_footer(students)
