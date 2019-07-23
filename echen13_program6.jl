# echen13_program6.jl
# parse MetaMap output

# create file handle
metamap_file = open("/data/courses/biol6535/data/metamap_output.txt", "r")

# create dictionary for keeping track of semantic type counts
sty_count_dict = Dict()

# read each
for line in readlines(metamap_file)
    #println("***$line***")

    # split
    line_array = split(line, "|")

    # get fields
    text_id = line_array[1]
    umls_name = line_array[4]
    umls_cui = line_array[5]
    umls_sty = line_array[6] # may have one or more: e.g., horm,orch,phsu
    trigger = line_array[7]

    # clean semantic type
    umls_sty = replace(umls_sty, r"\[|\]" => "")
    sty_array = split(umls_sty, ",")

    for s in sty_array
        if haskey(sty_count_dict, s)
            sty_count_dict[s] += 1
        else
            sty_count_dict[s] =1
        end
    end

    # extract trigger word
    # ["CANCER"-tx-1-"cancer"-noun-0]
    # ["History of - atrial fibrillation"-tx-1-"history of atrial fibrillation"-noun-0]
    trigger_capture = match(r"\[\"[^\"]+\"-[^-]+-[\d]+-\"([^\"]+)\"-[^\-]+-[0|1]", trigger)
    if trigger_capture != nothing
        println("$text_id|$umls_name|$umls_cui|$umls_sty|$(trigger_capture[1])")
    end

end

# sort by count
#=
println("Semantic Type Counts")
for (count,sty) in sort(collect(zip(values(sty_count_dict), keys(sty_count_dict))), rev=true)
    println("$sty\t$count")
end
=#
