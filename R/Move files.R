# Move images
files <- list.files("../Malmogram/Output", "png", recursive = T, full.names = T)
short_files <- list.files("../Malmogram/Output", "png", recursive = T, full.names = F)

file.copy(files, paste0("static/img/", short_files))
file.copy("../Malmogram/Output", "static/img", recursive = T)

# Create content
text <- '+++
showonlyimage = true
draft = false
image = "img/portfolio/a4-paper.jpg"
date = "2016-11-05T18:25:22+05:30"
title = "Name of the work 1"
weight = 0
+++

Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life. One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.
<!--more-->



Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean.

'

lines <- strsplit(text, "\n", fixed = T)[[1]]
files <- list.files("static/img/output", "png", recursive = T)
files <- paste0("/img/Output/", files)
files <- files[sample(67)]

for(i in 1:67){
  lines[4] <- paste0('image = "', files[i], '"')
  lines[13] <- paste0('![](', files[i], ")")
  write_lines(lines, paste0("content/portfolio/work", i, ".md"))
}
