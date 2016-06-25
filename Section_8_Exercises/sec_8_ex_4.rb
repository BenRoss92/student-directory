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
  #make 'n' be the index number for each array item
  n = 0
  #while each array item is not equal to nil
  while students[n] != nil
  #puts each student with that index number
    puts "#{students[n][:name]} (#{students[n][:cohort]} cohort)"
	#then move onto the next index number of the array
	n += 1
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