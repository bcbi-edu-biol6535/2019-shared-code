# echen13_program2.jl
# Strings, characters, and regular expressions
# Created: 2019-06-05

#=
# ask user to enter a phrase
println("hello and welcome to today's program")
print("please enter a phrase: ")
phrase = readline(stdin)

# tell user what they entered
print("you entered \"")
print(phrase)
print("\"\n")

# determine length of phrase
phrase_length = length(phrase)
println("the length of the phrase is $phrase_length")



# check length
if phrase_length < 10
	println("less than 10 characters")
elseif phrase_length == 10
	println("exactly 10 characters")
else
	println("just fine in length")
end

# get first character, last character, and substring
first_char = phrase[1]
println("first char = $first_char")

last_char = phrase[phrase_length]
println("last char = $last_char")
println("last char = $(phrase[length(phrase)])")

substring = phrase[2:4]
println("substring = $substring")

# check if phrase is or contains a particular word
if phrase == "hello"
	println("welcome to the program")
elseif occursin("good", phrase) && occursin("bad", phrase)
	println("phrase includes good and bad")
end



# while loop
# while phrase is less than 10 characters
# ask user to enter another phrase

while phrase_length < 10
	println("your phrase \"$phrase\" is less than 10 characters")
	print("enter another phrase: \n")
	global phrase = readline(stdin)
	global phrase_length = length(phrase)
end

# for loop
# for every number between 1 and length of string
# print out character at each position in string
for number in 1:phrase_length
	pos_character = phrase[number]
	println("character at position $number: $pos_character")
end

# regular expressions
# if phrase has letters abcd
if occursin(r"[abcd]", phrase)
	println("your phrase has an a, b, c, or d!")
else
	println("your phrase does not have an a, b, c, or d!")
end

# if phrase has numbers 0-9
if occursin(r"[0-9]", phrase)
	println("your phrase has numbers!")
else
	println("your phrase does not have numbers!")
end

# if phrase has sequence of lowercase, number, and uppercase
if occursin(r"[a-z][0-9][A-Z]", phrase)
	println("your phrase has the sequence!")
else
	println("your phrase does not have the sequence!")
end

=#

# write a program that asks user to enter a date
# then verify the date was entered in the correct format (mm/dd/yyyy)
# if date was entered correctly, ask user to enter another date
# note: date does not need to be valid just right format

print("enter a date (mm/dd/yyyy): ")
user_date = readline(stdin)

while !occursin(r"^\d{2}/\d{2}/\d{4}$", user_date)
	println("invalid date!")
	print("enter another date (mm/dd/yyyy): ")
	global user_date = readline(stdin)
end