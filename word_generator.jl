#!/bin/julia

using Distributions

syllables_counts = (readlines("data/syllables.txt") .|> lstrip .|> x -> split(x, ' '))[2:end]

counts = parse.(Int,map(x->x[1], syllables_counts))
syllables = map(x->x[2], syllables_counts)

syllables_dist = Categorical(counts./sum(counts))
rand_syllable = syllables[rand(syllables_dist, 10, 3)] |> eachrow .|> x -> join(x, ".")
