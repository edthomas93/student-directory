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
    puts "Now we have #{students.count} students, type another name to input another student or hit enter to stop"
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

def print_footer(names)
  center("Overall, we have #{names.count} great students")
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
