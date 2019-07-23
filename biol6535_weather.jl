### Scatter Plots using the iris dataset

using VegaLite
using VegaDatasets
using DataFrames

# Load dataset
weather_df = dataset("seattle-weather") |> DataFrame

# Create dual axis time series plot
weather_plot = @vlplot(
                title = "Weather Plot - Time Series (by month)",
                data = weather_df,
                width = 400, height = 300,
                encoding = {
                    x = {
                    field = "date",
                    axis = {format = "%b", title = nothing},
                    type = "temporal",
                    timeUnit = "month"
                    }
                },
                layer = [
                    {
                    mark = {opacity = 0.3, type = "area", color = "#85C5A6"},
                    encoding = {
                        y = {
                            aggregate = "average",
                            field = "temp_max",
                            scale = {domain = [0, 30]},
                            type = "quantitative",
                            axis = {title = "Avg. Temerature (C) (green area)", grid = nothing}
                        },
                        y2 = {
                            aggregate = "average",
                            field = "temp_min",
                            type = "quantitative"
                        }
                    }
                    },
                    {
                        mark = {stroke = "#85A9C5", type = "line", interpolate = "monotone"},
                        encoding = {
                            y = {
                                aggregate = "average",
                                field = "precipitation",
                                axis = {title = "Precipitation (inches) (blue line)", titleColor = "#85A9C5", grid = nothing}
                            }
                        }
                    }
                    ],
                    resolve = {scale = {y = "independent"}}
                );

save("weather_plot.pdf", weather_plot)
