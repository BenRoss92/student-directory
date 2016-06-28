def input_students
    
  puts "Please enter the name of the student"
  #get the first name
  name = gets.chomp
  #get the first cohort
  puts "Please enter their cohort"
  cohort = gets.chomp
  puts "To finish, just hit return twice"
  #create empty array for students
  students = []
  #while the name is not empty, repeat this code
  while !name.empty? do
      #add the student hash to the array
      #added cohort variable into each hash
      students << {name: name, cohort: cohort}
      puts "Now we have #{students.count} students"
      #get another name from the user
      name = gets.chomp
      #get another cohort from the user
      cohort = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
    students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)