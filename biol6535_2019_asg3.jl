################################################################################
#
# Program:		methods2019_asg3.jl
# Purpose: 		Process MeSH descriptors
# Description:	For each MeSH descriptor, gets and prints length,
#						prints first 3 characters if length is less than 10 or
#						prints last 3 characters otherwise, and checks if descriptor
#						includes any numbers.
# Created by: 			BCBI (bcbi@brown.edu)
# Last modified on:		2019-06-04
#
################################################################################

# asks user for MeSH descriptor
print("Enter a MeSH descriptor: ")
descriptor = readline(stdin)


# keeps asking for a MeSH descriptor until "qqq" is entered

# options: use != or !ismatch
while descriptor != "qqq"
#while !occursin(r"^qqq$", descriptor)
#while occursin(r"[^q]{3}", descriptor)
	# gets length of descriptor
	descriptor_length = length(descriptor)
	println("Length = $descriptor_length")

	# determine if descriptor length is less than 10
	# prints first 3 characters
	if descriptor_length < 10
		#option 1: use for loop
		#print("First Three Characters = ")
		# for i in 1:3
		# 	print(descriptor[i])
		# end
		# print("\n")

		# option 2: use substring
		#println("First Three Characters = $(descriptor[1:3])")

		if descriptor_length < 3
			println("First Three Characters = $(descriptor)")
		else
			println("First Three Characters = $(descriptor[1:3])")
		end

	# otherwise, prints last 3 characters
	else
		# option 1: use for loop
		# print("Last Three Characters = ")
		# for j in descriptor_length-2:descriptor_length
		# 	print(descriptor[j])
		# end
		# print("\n")

		# option 2: use substring
		#println("Last Three Characters = $(descriptor[descriptor_length-2:descriptor_length])")
		println("Last Three Characters = $(descriptor[end-2:end])")
	end

	# checks if descriptor includes any numbers
	print("Includes Numbers? = ")
	if occursin(r"[0-9]", descriptor)
		println("Yes")
	else
		println("No")
	end

	# asks user for another MeSH descriptor
	println()
	print("Enter another MeSH descriptor: ")
	global descriptor = readline(stdin)
end

##################### USE THE FOLLOWING MESH DESCRIPTORS FOR TESTING #####################
# Go to https://meshb.nlm.nih.gov/search
# Search for each MeSH Unique ID
#
# D001249	ccccccc
# D003924	Diabetes Mellitus, Type 2
# D013313	Stress Disorders, Post-Traumatic
# D053556	Keratin-1
#
################################################################################
