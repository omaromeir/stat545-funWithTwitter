funWithTwitter R Package
========================================================

This is the directory for homework 10 of STAT 545A/547C. It contains links to the homework report as well as instructions on how to install and test the package.

## Package Description

The main purpose of this package is to provide functions that connect to the twitter api and allow the user to explore and embed tweets into their R markdown reports. There are functions to display tweets using tweets' IDs either copied from a tweet's URL, for example: "https://twitter.com/STAT545/status/506900131086880768" or acquired using the function `getUserTimeline()`.

## Installation

To install the package you have to call the `install_github` function from the `devtools` package like this:
```R
# install.packages("devtools")
devtools::install_github("omaromeir/stat545-funWithTwitter")
```

To load the package you have to call `library(funWithTwitter)` without the "stat545-" in the repository name.

## Functions

* `getUserTimeline()` gets the timeline of a user and returns the ids of the tweets.

* `getTweet()` takes the id and returns the text and user name from a tweet.

* `embedTweet()` takes the id and prints the tweet in html form to be embedded into R markdown.

## Vignette

The report for this homework along with more fleshed out examples and reflections can be found within the vignette of the package. This vignette can be previewed in two ways:

* **THIS IS THE PREFERRED METHOD**. Load the package then load the vignette like this: `browseVignettes(package = "funWithTwitter")`.

* **DO NOT DO THIS UNLESS THE ABOVE METHOD DOES NOT WORK** Look at the markdown file directly, here's a [link](https://github.com/omaromeir/stat545-funWithTwitter/blob/master/vignettes/overview.md). **The css for tweets does not work here making everything look worse.**

