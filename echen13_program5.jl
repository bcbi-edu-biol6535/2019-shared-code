# echen13_program5.jl
# DataFrames

# load packages
using DataFrames
using CSV

# load file into DataFrame
adult_df = CSV.File("../data/adult.data", delim = ", ", header=0, footerskip=1) |> DataFrame

# get size
#display(size(adult_df))

# show first 10 lines only
#display(first(adult_df, 10))

# describe the dataframe
# display(describe(adult_df))

filtered_adult_df = adult_df[adult_df[:Column1] .> 85, [:Column1, :Column6, :Column7]]
#display(size(filtered_adult_df))
#display(first(filtered_adult_df, 10))

# rename columns
rename!(filtered_adult_df, :Column1 => :age)
rename!(filtered_adult_df, :Column6 => :marital_status)
rename!(filtered_adult_df, :Column7 => :occupation)

#display(describe(filtered_adult_df))

# write to File
#CSV.write("echen13_program5_output.txt", filtered_adult_df)

### IN CLASS EXERCISE
# 1. Determine frequency of each occupation value as a DataFrame
# 2. Sort results by frequency in descending order
# 3. Write results into a file

occ_count_df = by(filtered_adult_df, :occupation, N=:occupation => length)
sort!(occ_count_df, (:N), rev=(true))
display(occ_count_df)
CSV.write("echen13_program5_output2.txt", occ_count_df)
