
def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # gets the first students name
  name = gets.chomp
  # while the name is not empty, repeat this code:
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november} 
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villans Academy"
  puts "_____________"
end


# def print(students)
#   students = students.each_with_index do |student, index|
#      puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end


# def print(students)
#   students = students.each_with_index do |student, index|
#   	if (student[:name])[0] == "D" || (student[:name])[0] == "d"# only print students whos names begin with "D" or "d"
#   		puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
#   		end
#   	end
# end

def print(students)
  students = students.each_with_index do |student, index|
  	if (student[:name]).length < 12 # only print students who's names are shorter than 12 characters
  		puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
  		end
  	end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students "
end

# nothing happens until we call the mothods
students = input_students
print_header
print(students)
print_footer(students)

