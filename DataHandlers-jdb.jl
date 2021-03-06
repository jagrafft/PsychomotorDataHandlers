"Count and percentage of unique values in an `IndexedTable`."
countn(x) = unique(x) .|> (n -> (c = length(filter(z -> n == z, x)); (n=n, c=c, p=c/length(x)))) |> table

"Minimum and maximum value in an array."
extent(x) = [minimum(x), maximum(x)]

"Convert text timestamp `mm:ss` to `AbstractFloat` representing seconds."
mmssToFloat(v::AbstractString)::AbstractFloat = typeof(v) == Missing ? missing : (split(v, ":") |> x -> [parse(Int, y) for y in x] |> x -> (60*x[1] + x[2]) |> float)

"Rebase `v` such that `n = 0; v[n+1] = v[n+1] - a[1]`."
zerobase(v::Array{<:AbstractFloat, 1})::Array{AbstractFloat, 1} = v .|> x -> x - first(v)