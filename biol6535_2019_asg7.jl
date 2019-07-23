# asg7.jl
# DataFrames

using CSV
using DataFrames

# read in MIMIC-III admissions file
mimic_df = CSV.File("/data/courses/biol6535/data/mimic_asthma_admissions.txt", delim="\t", header=1, footerskip=0) |> DataFrame

# print first five rows
println("******************")
display(first(mimic_df, 5))

# describe df
println("******************")
display(describe(mimic_df))

# created filtered df
filtered_mimic_df = mimic_df[mimic_df[:INSURANCE] .== "Medicaid", [:MARITAL_STATUS]]

println("******************")
display(first(filtered_mimic_df, 5))

println("******************")
display(describe(filtered_mimic_df))

# get marital status counts
ms_count_df = by(filtered_mimic_df, :MARITAL_STATUS, N = :MARITAL_STATUS => length)
display(ms_count_df)
sort!(ms_count_df, (:N), rev=(true))
display(ms_count_df)

# write to output file
CSV.write("biol6535_asg7_output.txt", ms_count_df)
