################################################################################
#
# Program:    	biol6535_2019_asg4.jl
# Purpose:      Process ICD-10 descriptions
# Description:  For each description, gets and prints the number of words
#               and unique words; checks if each word includes a comma or hyphen;
#				and converts number words that are less than five to digits;
#				and prints the updated description
# Created by: BCBI (bcbi@brown.edu)
# Last modified on: 2019-06-06
#
################################################################################

##################### USE THE FOLLOWING ICD DESCRIPTIONS FOR TESTING ###########
# Go to https://coder.aapc.com/icd-10-codes-range
# Search for each ICD-10 code
#
# E11.9		Type 2 diabetes mellitus without complications
# N18.3		Chronic kidney disease, stage 3
# G44.309	Post-traumatic headache, unspecified, not intractable
#
################################################################################

# create number dictionary
num_dict = Dict("1" => "one", "2" => "two", "3" => "three", "4" => "four", "5" => "five")
#=
num_dict = Dict()
num_dict["1"] = "one"
num_dict["2"] = "two"
num_dict["3"] = "three"
num_dict["4"] = "four"
num_dict["5"] = "five"
=#

while (true)

  # asks user for ICD description
  println()
  print("Enter an ICD description: ")
  description = readline(stdin)

  if description == "qqq"
  	break
  end

  # determine and print the number of words
  description_array = split(description, " ")
  description_array_length = length(description_array)
  println()
  println("Number of Words = $description_array_length")
  println("Number of Unique Words = $(length(unique(description_array)))")
  println()

	# includes pattern of lowercase letters, space, number
	  if occursin(r"[a-zA-Z]+\s[0-9]", description)
		  println("Description = Includes letters-space-number pattern\n")
	  end

	  # captures pattern
	  pattern_capture = match(r"([a-zA-Z]+\s[0-9])", description)
	  if pattern_capture != nothing
	  	println("Description = Includes letters-space-number pattern --> $(pattern_capture[1])\n")
	  end

  # checks each word to determine if it includes a comma or hyphen
  # also check if a word is a number word (one, two, three, etc.) and convert to digit (1, 2, 3, etc.)
  new_description = ""                # option 1: keep track of new description as string
  new_description_array = []          # option 2: keep track of new description as array
  new_description_regex = description       # option 3: keep track of new description using regex

  for word in description_array

      # includes a hyphen
      if occursin("-", word)
          println("$word = Includes a hyphen")
      end

      # ends with a comma
      if occursin(r",$", word)
          println("$word = Ends with a comma")
      end

      # starts with the letter d
      if occursin(r"^d", word)
          println("$word = Starts with a d")
      end

      # check if number word and convert
      if haskey(num_dict, word)
      	 println("$word = Convert to $(num_dict[word])")

        new_description = new_description * num_dict[word] * " "   # option 1
        push!(new_description_array, num_dict[word])         # option 2
        new_description_regex = replace(new_description_regex, word => num_dict[word]) # option 3
      else
        new_description = new_description * word * " "
        push!(new_description_array, word)
      end
  end

  # print new description from string or array
  println()
  println("Original description: $description")
  println("Original description (from array) = $(join(description_array, " "))")

  println("New description (from string) = $(chop(new_description))")
  println("New description (from array) = $(join(new_description_array, " "))")
  println("New description (from regex) = $new_description_regex")

end
