# biol6535_2019_asg5.jl
# Last updated: 2019-06-06

# open file for reading
adm_file = open("/data/courses/biol6535/data/mimic_asthma_admissions.txt")

# create dictionary to keep track of counts
marital_dict = Dict()

skip_flag = 42

# go through the file, lin-by-line
for line in readlines(adm_file)

	# skip first line (header)
	if skip_flag == 42
		global skip_flag = 98
		continue
	end

	# split line into array
	line_array = split(line, "\t")

	# get the marital status value (column 7)
	marital_status = line_array[7]

	# if status encountered, incremenet by one, otherwise start with one
	if haskey(marital_dict, marital_status)
		marital_dict[marital_status] += 1
	else
		marital_dict[marital_status] = 1
	end

end

output_file = open("biol6535_2019_asg5_output.txt", "w")

# print out encounters by key
for status in keys(marital_dict)

	println("Marital Status \"$status\" occurs $(marital_dict[status])")

end


# print out encounters by value >>> Send this to file
println("SORTED by VALUE!")
for (count, status) in sort(collect(zip(values(marital_dict),keys(marital_dict))), rev=true)
	println("Marital Status \"$status\" occurs $(marital_dict[status])")
	write(output_file, "Marital Status \"$status\" occurs $(marital_dict[status])\n")

end


# print out encounters by key
println("SORTED by KEY!")
for (status, count) in sort(collect(zip(keys(marital_dict),values(marital_dict))), rev=false)
	println("Marital Status \"$status\" occurs $(marital_dict[status])")

end

close(output_file)
