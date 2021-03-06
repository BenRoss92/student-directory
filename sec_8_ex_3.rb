def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
      #add the student hash to the array
      students << {name: name, cohort: :november}
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
  #iterate over each student and delete if
  # NOTE: COULD USE SELECT WITH IF STATMEMENT, THEN COPY CODE WITHIN PRINT_FOOTER METHOD INTO PRINT(STUDENTS) METHOD
  students.delete_if do |student|
    #student's name is bigger than or equal to 12 characters
    student[:name].length >= 12 
  end
    #iterate over each student
  students.each do |student|
    #display student name and cohort
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end
    
def print_footer(students)
  #students array now only contains chosen students
  puts "Overall, we have #{students.count} great students"
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
