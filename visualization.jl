#=using VegaLite, RDatasets, DataFrames

iris = dataset("datasets", "iris")

p = @vlplot(
	data = iris,
	mark = {type = boxplot, extent = min-max},
	encoding = {
		x = {field = Species, type = ordinal},
		y = {axis = {title = population}}
	}
	)

savefig(p, "plot.pdf")
=#

using VegaLite, VegaDatasets, DataFrames
#=
pop_df = dataset("population") |> DataFrame
p = @vlplot(
	data = pop_df,
	transform = [{
		aggregate = [
			{op=:q1, field=:people, as=:lowerBox},
			{op=:q3, field=:people, as=:upperBox},
			{op=:median, field=:people, as=:midBox},
			{op=:min, field=:people, as=:lowerWhisker},
			{op=:max, field=:people, as=:upperWhisker}
		],
		groupby=[:age]
	}]
) +
@vlplot(
	mark={:rule},
	y={"lowerWhisker:q", axis={title="population"}},
	y2={field = "lowerBox", type = "quantitative"},
	x= {field = "age", type = "ordinal"}
)+
@vlplot(
	mark={:rule},
	y={"upperBox:q"},
	y2="upperWhisker:q",
	x="age:o"
)+
@vlplot(
	mark={:bar},
	y={"lowerBox:q"},
	y2="upperBox:q",
	x="age:o",
	size={value=5}
)+
@vlplot(
	mark={:tick},
	y={"midBox:q"},
	x="age:o",
	color={value=:white},
	size={value=5}
);

save("box_whisker.pdf", p)
=#
#In class exercise
#=
iris_df = dataset("iris") |> DataFrame
p = @vlplot(
	data = iris_df,
	transform = [{
		aggregate = [
			{op=:q1, field=:petalLength, as=:lowerBox},
			{op=:q3, field=:petalLength, as=:upperBox},
			{op=:median, field=:petalLength, as=:midBox},
			{op=:min, field=:petalLength, as=:lowerWhisker},
			{op=:max, field=:petalLength, as=:upperWhisker}
		],
		groupby=[:species]
	}]
) +
@vlplot(
	mark={:rule},
	y={"lowerWhisker:q", axis={title="petalLength"}},
	y2={field = "lowerBox", type = "quantitative"},
	x= {field = "species", type = "ordinal"}
)+
@vlplot(
	mark={:rule},
	y={"upperBox:q"},
	y2="upperWhisker:q",
	x="species:o"
)+
@vlplot(
	mark={:bar},
	y={"lowerBox:q"},
	y2="upperBox:q",
	x="species:o",
	size={value=5}
)+
@vlplot(
	mark={:tick},
	y={"midBox:q"},
	x="species:o",
	color={value=:white},
	size={value=5}
);

save("iris_petal.pdf", p)
=#
#multiple panels

p = dataset("iris") |>
@vlplot(repeat={column=[:petalLength,:petalWidth,:sepalLength,:sepalWidth]}) +
(	
	@vlplot() +
	@vlplot(
		mark={:rule},
		y={filed={repeat=:column}, aggregate=:min, typ=:quantitative},
		y2={field ={repeat=:column},aggregate=:q1, type = "quantitative"},
		x= {field = "species", type = "ordinal"}
	)+
	@vlplot(
		mark={:rule},
		y={field={repeat=:column}, aggregate=:q3, typ=:quantitative},
		y2={field ={repeat=:column},aggregate=:max, type = "quantitative"},
		x="species:o"
	)+
	@vlplot(
		mark={:bar},
		y={field ={repeat=:column},aggregate=:q1, type = "quantitative"},
		y2={field ={repeat=:column},aggregate=:q3, type = "quantitative"},
		x="species:o",
		size={value=5}
	)+
	@vlplot(
		mark={:tick},
		y={field ={repeat=:column},aggregate=:median, type = "quantitative"},
		x="species:o",
		color={value=:white},
		size={value=5}
	)

);


save("iris.pdf", p)
#pop_df = DataFrame(pop)
#=
describe(pop_df)


box_whisker = @vlplot(
	data = pop_df,
	mark = {type = "boxplot", extent = "min-max"},
	encoding = {
		x = {field = "age", type = "ordinal"},
		y = {
			field = "people", 
			type = "quantitative", 
			axis = {title = "population"}
		}
	}
);

box_whisker = @vlplot(
	data = pop_df,
	mark = {type = "boxplot"},
	encoding = {
		x = {
			field = "people", 
			type = "quantitative", 
			axis = {title = "population"}
		}
	}
);

save("pic.pdf", box_whisker)
=#