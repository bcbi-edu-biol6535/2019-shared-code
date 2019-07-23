# asg10.jl
# Data Visualization

using CSV
using DataFrames
using VegaLite

# read in MIMIC-III admissions file
mimic_df = CSV.File("/data/courses/biol6535/data/mimic_asthma_admissions.txt", delim="\t", header=1, footerskip=0) |> DataFrame


# get marital status counts
ms_count_df = by(mimic_df, :MARITAL_STATUS, N = :MARITAL_STATUS => length)
display(ms_count_df)
sort!(ms_count_df, (:N), rev=(true))
display(ms_count_df)

# Create a bar chart to visualize frequencies of marital status from the mimic_asthma_admissions.txt file
ms_count_plot = @vlplot(
                title = "Marital Status Frequencies- MIMIC Asthma",
                data = ms_count_df, # frequency dataframe
                encoding = {
                    y = {
                        field = "MARITAL_STATUS", type = "ordinal",
                        axis = {title = "Marital Status"},
                        sort = {encoding = "y"}
                    },
                    x = {
                        aggregate = "sum", field = "N", type = "quantitative",
                        axis = {title = "Frequency"},
                        scale = {domain = [0,2000]} #change the scale for better visualization of the entire set
                    },
                    color = {
                            field = "MARITAL_STATUS",
                            type = "ordinal",
                            scale = {scheme = "viridis"}, #color can be one or multiple to show differences between each type of marital status, scheeme found on VegaLite documentation
                            legend = nothing # remove legend because it is redundant
                    }
                    },
                layer = [{
                        mark = {type = "bar"}}, #layer bar chart and text to print out the frequencies of each status
                        {
                        mark = {
                                type = "text", # this type of mark prints out the text next to each marital status bar
                                align = "left",
                                baseline = "middle",
                                dx = 3
                                },
                    encoding = {
                            text = {field = "N", type = "quantitative"}
                    }
                    }]
                );

# save plot as a pdf
save("biol6535_asg10_plot.pdf", ms_count_plot)
