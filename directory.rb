puts "The students of Villains Academy"
puts "-------------"
#let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Black-Roberts",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker", 
  "Joffrey Baratheon",
  "Norman of Kingdom Come"
]
#and then print them
students.each do |student|
  puts student
end
#finally, we print the total number of students
puts "Overall, we have #{students.count} great students"
