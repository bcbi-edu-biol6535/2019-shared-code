# biol6535_asg8.jl
# parse MetaMap output
# Determines and prints frequency of each UMLS Concept Unique Identifier (CUI)
# Finds lines including specific UMLS semantic types (dsyn, mobd, neop, fndg, phsu) 
# and prints out the following for each: text_id|umls_cui|umls_desc|umls_sty_full_name

# create file handle for input files
metamap_file = open("/data/courses/biol6535/data/metamap_output.txt", "r")
sty_file = open("/data/courses/biol6535/data/SemanticTypes_2018AB.txt", "r")

# create file handle for output files
output_lines_file = open("biol6535_asg8_output_lines.txt", "w")
write(output_lines_file, "id|umls_cui|umls_desc|umls_sty\n")

output_counts_file = open("biol6535_asg8_output_counts.txt", "w")
write(output_counts_file, "umls_cui\tcount\n")

# initialize dictionaries
sty_mapping_dict = Dict()
umls_cui_count_dict = Dict()

# load semantic type mapping dictionary from file
for line in readlines(sty_file)
	line_array = split(line, "|")
	sty_mapping_dict[line_array[1]] = line_array[3]
end
close(sty_file)

# read each line in MetaMap output file
for line in readlines(metamap_file)

	# split line into an array, based on tab delimiter
	line_array = split(line, "|")

	# store from array 
	id = line_array[1]
	umls_desc = line_array[4]
	umls_cui = line_array[5]
	umls_sty = line_array[6]	# may include one or more

	# ULMS CUIs
	if haskey(umls_cui_count_dict, umls_cui)
		umls_cui_count_dict[umls_cui] += 1
	else
		umls_cui_count_dict[umls_cui] = 1 
	end
	
	# UMLS semantic types
	umls_sty = replace(umls_sty, r"\[|\]" => "")
	sty_array = split(umls_sty, ",")
		
	# loop through each sty
	for s in sty_array
		if occursin(r"dsyn|mobd|neop|fndg|phsu", s)
			println("$id|$umls_cui|$umls_desc|$(sty_mapping_dict[s])")
			write(output_lines_file, "$id|$umls_cui|$umls_desc|$(sty_mapping_dict[s])\n")
		end
	end
end

# sorted by count
for (count, cui) in sort(collect(zip(values(umls_cui_count_dict),keys(umls_cui_count_dict))), rev=true)
	println("$cui\t$count")
	write(output_counts_file, "$cui\t$count\n")
end

close(output_lines_file)
close(output_counts_file)





