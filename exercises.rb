def center(string)
  puts string.center(80)
end

def input_students
  puts "Please enter the student's name"
  students= []
  name = gets.chomp.capitalize
  puts "Please enter the student's cohort"
  cohort = gets.chomp.capitalize.strip.to_sym
    if cohort.empty?
      cohort = :July
    end
  #while the name is not empty repeat this code
  while !name.empty? do
    students << {name: name, cohort: cohort}
    if students.count > 1
      puts "Now we have #{students.count} students, type another name to input another student or hit enter to stop"
    else
      puts "Now we have #{students.count} student, type another name to input another student or hit enter to stop"
    end
    name = gets.chomp.capitalize
      if name.empty?
        break
      end
    puts "Please enter the student's cohort"
    cohort = gets.chomp.capitalize.strip.to_sym
    if cohort.empty?
      cohort = :July
    end
  end
  students
end

def print_header
  center("The students of Villains Academy")
  center("--------------------------------")
end

def print(students)
  index = 0
  while index < students.length
    center("#{students[index][:name]} (#{students[index][:cohort]} cohort)")
    index +=1
  end
end

def print_by_cohort(students)
  puts "Which cohort would you like to see?"
  desired_cohort = gets.chomp.capitalize
  cohort_symbol = desired_cohort.to_sym
  students_by_cohort = []
  students.map do |student|
    if student[:cohort] == cohort_symbol
      students_by_cohort << student
    end
  end
  center("Here are the #{desired_cohort} students")
  students_by_cohort.each do |name|
    center("#{name[:name]}")
  end
end

def print_footer(names)
  if names.count > 1
    center("Overall, we have #{names.count} great students")
  else
    center("Overall, we have #{names.count} great student")
  end
end

#nothing happens until we call the methods
students = input_students
print_header
#print(students)
print_by_cohort(students)
print_footer(students)
