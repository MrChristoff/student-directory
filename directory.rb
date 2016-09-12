
def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # gets the first students name
  name = gets[0...-1]
  # while the name is not empty, repeat this code:
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november, hobbies: "being evil", gender: "prefer not to say"} 
    students.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
    puts "Now we have #{students.count} #{plural_or_single}"
    # get another name from the user
    name = gets[0...-1]
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Villans Academy".center(100)
  puts "_____________".center(100)
end


def print(students)
  students = students.each_with_index do |student, index|
      puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_students_begining_with(students) # only print students whos names begin with "D" or "d"
  students = students.each_with_index do |student, index|
  	if (student[:name])[0] == "D" || (student[:name])[0] == "d"
  		puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
  		end
  	end
end

def print_students_with_names_less_than(students) # only print students who's names are shorter than 12 characters
  students = students.each_with_index do |student, index|
  	if (student[:name]).length < 12 
  		puts "#{index + 1}.#{student[:name]} (#{student[:cohort]} cohort)"
  		end
  	end
end

def print_without_each(arr) # print without using the 'each' method, and use loop instead
  n = 0
  until n == arr.length
    student = arr[n]
    puts "#{n + 1}.#{student[:name]} (#{student[:cohort]} cohort) hobby: #{student[:hobbies]}".center(100)
    n += 1
  end
end

def print_footer(names)
	names.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
  puts "Overall, we have #{names.count} great #{plural_or_single} ".center(100)
end

# nothing happens until we call the mothods
students = input_students
print_header
print_without_each(students)
print_footer(students)

