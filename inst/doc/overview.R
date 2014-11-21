## ------------------------------------------------------------------------
library(funWithTwitter)

## ------------------------------------------------------------------------
(getUserTimeline(screen_name = "STAT545"))

(getUserTimeline(screen_name = "STAT545", include_rts = FALSE))

(getUserTimeline(screen_name = "STAT545", count = 5, exclude_replies = FALSE, include_rts = FALSE))

## ------------------------------------------------------------------------
getTweet()

getTweet("535530698451726336")

## ----results='asis'------------------------------------------------------
embedTweet()

embedTweet("535530698451726336")

## ------------------------------------------------------------------------
tweet <- getUserTimeline("STAT545", count = 1)
(getTweet(tweet))

## ------------------------------------------------------------------------
tweet <- getUserTimeline("STAT545", count = 1, include_rt = FALSE)
(getTweet(tweet))

## ----results='asis'------------------------------------------------------
tweets <- getUserTimeline("STAT545", count = 5)

knitr::kable(plyr::adply(tweets, 1, getTweet))

## ----results='asis'------------------------------------------------------
tweets <- getUserTimeline("STAT545", count = 5)

plyr::a_ply(tweets, 1, embedTweet)

