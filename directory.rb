
def input_students_non_iteractive
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  # creates an empty array
  students = []
  # gets the first students name
  name = gets[0...-1]
  # while the name is not empty, repeat this code:
  while !name.empty? do
    # add the student hash to the array
    student_template = 
    students << {name: name, cohort: :november, hobbies: "being evil", gender: "prefer not to say"} 
    students.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
    puts "Now we have #{students.count} #{plural_or_single}"
    # get another name from the user
    name = gets[0...-1]
  end
  # return the array of students
  students
end

def input_students
  puts "Please enter the details of the student(s)"
  continue = true
  students = []
  while continue == true do
    # add the student hash to the array
    student_template = {name: "To be confirmed", cohort: :November, hobbie: "To be confirmed", gender: "To be confirmed"} 
    student_template.each do |key, value| # itterates the 'template' hash assigning the new value to the key selected
      puts "Please enter a #{key}"
      new_value = gets.chomp.capitalize.to_sym
      student_template[key] = new_value if new_value != :""
    end

    students << student_template
    students.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
    puts "Now we have #{students.count} #{plural_or_single}"
    puts "continue to add students? Y/N"
    gets.chomp.upcase == "Y" ? continue = true : continue = false

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
    puts "#{n + 1}.#{student[:name]} (#{student[:cohort]} cohort) Hobby: #{student[:hobbies]} Gender: #{student[:gender]}".center(100)
    n += 1
  end
end

def print_footer(names)
	names.count == 1 ? plural_or_single = "student" : plural_or_single = "students"
  puts "Overall, we have #{names.count} great #{plural_or_single} ".center(100)
  puts "******************".center(100)
  puts ""
end

# nothing happens until we call the mothods
students = input_students
print_header
print_without_each(students)
print_footer(students)

