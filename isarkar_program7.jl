
# program7: stats & machine learning

# load needed packages
using CSV
using DataFrames

using Distributions
using HypothesisTests

using DecisionTree

using Random

Random.seed!(42)


#### MACHINE LEARNING

# load the iris dataset
iris_df = CSV.File("/data/courses/biol6535/data/iris.data", header=0, footerskip=1) |> DataFrame
println(describe(iris_df))

# coerce features in specific datatypes for performance
labels = string.(iris_df[5])
features = convert(Array{Float64,2}, iris_df[:, 1:4])

# select 2 random features
# 10 trees
# 0.5 portions of samples
# max depth of 6
model = build_forest(labels, features, 2, 10, 0.5, 6)

println(apply_forest(model, [5.1,3.5,1.4,0.2]))

# run a 3-fold validatioooon using 2 random features per split
n_folds = 3; n_subfeatures = 2

# determine accuracy of models from dataset
accuracy = nfoldCV_forest(labels, features, n_folds, n_subfeatures)
println(accuracy)

# create another model (just one tree instead of a forest)
model = DecisionTreeClassifier(max_depth = 2)
fit!(model,features, labels)

# print out the tree
print_tree(model,5)



# println(labels)
# println(features)


##### STATS

#println("hello.")
#=
adult_df = CSV.File("../data/adult.data", header=0, footerskip=1) |> DataFrame

avg_age = mean(adult_df[1])
med_age = median(adult_df[1])
max_age = maximum(adult_df[1])

println("the avg age is $avg_age; median is $med_age; max is $max_age")

# get ages for those who were never married and those who are married
nvr_age_array = adult_df[adult_df[6] .== " Never-married", 1]
mar_age_array = adult_df[adult_df[6] .== " Married-civ-spouse", 1]

# calculate mean & stdev for nvr and mar
nvr_age_avg = mean(nvr_age_array)
nvr_age_std = std(nvr_age_array)

mar_age_avg = mean(mar_age_array)
mar_age_std = std(mar_age_array)

println("average NVR age is $nvr_age_avg (+/- $nvr_age_std)")
println("average MAR age is $mar_age_avg (+/- $mar_age_std)")


nvr_gaussian = Normal(nvr_age_avg, nvr_age_std)
mar_gaussian = Normal(mar_age_avg, mar_age_std)

n = 2500
Random.seed!(42)

nvr_sample = rand(nvr_gaussian, n)
mar_sample = rand(mar_gaussian, n)

display(EqualVarianceTTest(nvr_sample,mar_sample))


=#









#

