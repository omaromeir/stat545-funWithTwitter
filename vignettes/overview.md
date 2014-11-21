Package Overview
----------------

The main purpose of this package is to provide functions that connect to
the twitter api and allow the user to explore and embed tweets into
their R markdown reports. There are functions to display tweets using
tweets' IDs either copied from a tweet's URL, for example:
"<https://twitter.com/STAT545/status/506900131086880768>" or acquired
using the function `getUserTimeline()`. `getUserTimeline()` is used to
acquire a number of the most recent tweets in a user's timeline. The IDs
can be used to display the tweet as text using `getTweet()` or wrapped
in html to embed in Rmarkdown reports using `embedTweet()`.

Functions
---------

First load the package:

    library(funWithTwitter)

### getUserTimeline()

This is the main function from the package. This is a function to return
tweet ids from a twitter user's timeline starting from the most recent
tweet. The results can be used as input for `getTweet()` or
`embedTweet()` functions.

Examples:

    (getUserTimeline(screen_name = "STAT545"))

    ##                    1 
    ## "535850811218464768"

    (getUserTimeline(screen_name = "STAT545", include_rts = FALSE))

    ##                    1 
    ## "535696244891340800"

    (getUserTimeline(screen_name = "STAT545", count = 5, exclude_replies = FALSE, include_rts = FALSE))

    ##                    1 
    ## "535696244891340800"

### getTweet()

This function is used to display a tweet's text along with the
screen\_name of the user who wrote it. The function takes a tweet's id
which can be found in a tweet's URL. Example:
"<https://twitter.com/STAT545/status/506900131086880768>"

    getTweet()

    ## [1] "@STAT545: Full disclosure: tweets from this account will be a mix of interesting data science stuff and STAT 545A / STAT 547M course minutiae."

    getTweet("535530698451726336")

    ## [1] "@ubcnews: 'Nothing will stop me from wanting to be a teacher' Despite tumultuous times, demand for #UBC teacher education grows http://t.co/dXIJHC6FPf"

### embedTweet()

This function returns a tweet's text, the username, and the user's
avatar wrapped in html code to be used in R markdown reports. The chunk
needs to have the options `results='asis'` for this to work.

    embedTweet()

<style>
            #tweet {
            border: 1px solid;
            border-color: #9f9f9f;
            border-radius: 5px;
            background-color:#f1f1f1;
            padding:5px;
            }
            img {
            border-radius: 5px;
            border: 1px solid;
            margin-right:5px;
            }
            #tweet-text {
            border-radius: 5px;
            background-color:#ffffff;
            padding:5px;
            }
            #tweet a {
            text-decoration:none;
            color:9f9f9f;
            }
            #link {
            font-size:8px;
            color:9f9f9f;
            }
            </style>
<img src = "http://pbs.twimg.com/profile_images/506894311955243008/0D63lczz_normal.png"/><a href = "https://twitter.com/STAT545">
@STAT545</a>
<p id="tweet-text">
Full disclosure: tweets from this account will be a mix of interesting
data science stuff and STAT 545A / STAT 547M course minutiae.
</p>
<a id = "link" href= "https://twitter.com/STAT545/status/506900131086880768">link</a>

    embedTweet("535530698451726336")

<style>
            #tweet {
            border: 1px solid;
            border-color: #9f9f9f;
            border-radius: 5px;
            background-color:#f1f1f1;
            padding:5px;
            }
            img {
            border-radius: 5px;
            border: 1px solid;
            margin-right:5px;
            }
            #tweet-text {
            border-radius: 5px;
            background-color:#ffffff;
            padding:5px;
            }
            #tweet a {
            text-decoration:none;
            color:9f9f9f;
            }
            #link {
            font-size:8px;
            color:9f9f9f;
            }
            </style>
<img src = "http://pbs.twimg.com/profile_images/2709185304/c4460b6a6a2f0bc7836a043c4c6a569d_normal.jpeg"/><a href = "https://twitter.com/ubcnews">
@ubcnews</a>
<p id="tweet-text">
'Nothing will stop me from wanting to be a teacher' Despite tumultuous
times, demand for \#UBC teacher education grows <http://t.co/dXIJHC6FPf>
</p>
<a id = "link" href= "https://twitter.com/ubcnews/status/535530698451726336">link</a>

### Futher use

The `getUserTimeline()` function can be used with `getTweet()` or
`embedTweet()` for some interesting usecases. For example:

-   Print the most recent tweet from the "STAT545" account:

<!-- -->

    tweet <- getUserTimeline("STAT545", count = 1)
    (getTweet(tweet))

    ## [1] "@STAT545: RT @ethanwhite: \"testing your code is not about being a programmer. It’s about making sure that things work\" http://t.co/m6OjWQUPoQ great p…"

-   Print the most recent tweet that is not a retweet:

<!-- -->

    tweet <- getUserTimeline("STAT545", count = 1, include_rt = FALSE)
    (getTweet(tweet))

    ## [1] "@STAT545: Reminder: HW10 can be submitted anytime before class Mon Nov 24 http://t.co/j48bzrtLj5"

For multiple tweets we can use the a\*ply family function from `plyr` to
do some interesting things. For example:

-   Print the 5 most recent tweets:

<!-- -->

    tweets <- getUserTimeline("STAT545", count = 5)

    knitr::kable(plyr::adply(tweets, 1, getTweet))

<table>
<thead>
<tr class="header">
<th align="left">X1</th>
<th align="left">V1</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">1</td>
<td align="left"><span class="citation">@STAT545</span>: RT <span class="citation">@ethanwhite</span>: &quot;testing your code is not about being a programmer. It’s about making sure that things work&quot; <a href="http://t.co/m6OjWQUPoQ">http://t.co/m6OjWQUPoQ</a> great p…</td>
</tr>
<tr class="even">
<td align="left">2</td>
<td align="left"><span class="citation">@STAT545</span>: RT <span class="citation">@mwilsonsayres</span>: Today I'm collecting #TAtips: advice from, and for, teaching assistants. Please share your experience as a TA &amp; working …</td>
</tr>
<tr class="odd">
<td align="left">3</td>
<td align="left"><span class="citation">@STAT545</span>: Reminder: HW10 can be submitted anytime before class Mon Nov 24 <a href="http://t.co/j48bzrtLj5">http://t.co/j48bzrtLj5</a></td>
</tr>
<tr class="even">
<td align="left">4</td>
<td align="left"><span class="citation">@STAT545</span>: RT <span class="citation">@pgbovine</span>: i'm grateful someone took the effort to write this book, but OMG THIS LOOKS SO PAINFULLLLLLLL <a href="http://t.co/vKbBqWfGSz">http://t.co/vKbBqWfGSz</a></td>
</tr>
<tr class="odd">
<td align="left">5</td>
<td align="left"><span class="citation">@STAT545</span>: RT <span class="citation">@deaneckles</span>: PhD students: Come spend your summer with the Facebook Data Science team! <a href="https://t.co/G4XaxxLnEr">https://t.co/G4XaxxLnEr</a></td>
</tr>
<tr class="even">
<td align="left">See o</td>
<td align="left">ur team here <a href="https:/…">https:/…</a></td>
</tr>
</tbody>
</table>

-   Embed the 5 most recent tweets:

<!-- -->

    tweets <- getUserTimeline("STAT545", count = 5)

    plyr::a_ply(tweets, 1, embedTweet)

<style>
            #tweet {
            border: 1px solid;
            border-color: #9f9f9f;
            border-radius: 5px;
            background-color:#f1f1f1;
            padding:5px;
            }
            img {
            border-radius: 5px;
            border: 1px solid;
            margin-right:5px;
            }
            #tweet-text {
            border-radius: 5px;
            background-color:#ffffff;
            padding:5px;
            }
            #tweet a {
            text-decoration:none;
            color:9f9f9f;
            }
            #link {
            font-size:8px;
            color:9f9f9f;
            }
            </style>
<img src = "http://pbs.twimg.com/profile_images/506894311955243008/0D63lczz_normal.png"/><a href = "https://twitter.com/STAT545">
@STAT545</a>
<p id="tweet-text">
RT @ethanwhite: "testing your code is not about being a programmer. It’s
about making sure that things work" <http://t.co/m6OjWQUPoQ> great p…
</p>
<a id = "link" href= "https://twitter.com/STAT545/status/535850811218464768">link</a>

<style>
            #tweet {
            border: 1px solid;
            border-color: #9f9f9f;
            border-radius: 5px;
            background-color:#f1f1f1;
            padding:5px;
            }
            img {
            border-radius: 5px;
            border: 1px solid;
            margin-right:5px;
            }
            #tweet-text {
            border-radius: 5px;
            background-color:#ffffff;
            padding:5px;
            }
            #tweet a {
            text-decoration:none;
            color:9f9f9f;
            }
            #link {
            font-size:8px;
            color:9f9f9f;
            }
            </style>
<img src = "http://pbs.twimg.com/profile_images/506894311955243008/0D63lczz_normal.png"/><a href = "https://twitter.com/STAT545">
@STAT545</a>
<p id="tweet-text">
RT @mwilsonsayres: Today I'm collecting \#TAtips: advice from, and for,
teaching assistants. Please share your experience as a TA & working …
</p>
<a id = "link" href= "https://twitter.com/STAT545/status/535846280971292672">link</a>

<style>
            #tweet {
            border: 1px solid;
            border-color: #9f9f9f;
            border-radius: 5px;
            background-color:#f1f1f1;
            padding:5px;
            }
            img {
            border-radius: 5px;
            border: 1px solid;
            margin-right:5px;
            }
            #tweet-text {
            border-radius: 5px;
            background-color:#ffffff;
            padding:5px;
            }
            #tweet a {
            text-decoration:none;
            color:9f9f9f;
            }
            #link {
            font-size:8px;
            color:9f9f9f;
            }
            </style>
<img src = "http://pbs.twimg.com/profile_images/506894311955243008/0D63lczz_normal.png"/><a href = "https://twitter.com/STAT545">
@STAT545</a>
<p id="tweet-text">
Reminder: HW10 can be submitted anytime before class Mon Nov 24
<http://t.co/j48bzrtLj5>
</p>
<a id = "link" href= "https://twitter.com/STAT545/status/535696244891340800">link</a>

<style>
            #tweet {
            border: 1px solid;
            border-color: #9f9f9f;
            border-radius: 5px;
            background-color:#f1f1f1;
            padding:5px;
            }
            img {
            border-radius: 5px;
            border: 1px solid;
            margin-right:5px;
            }
            #tweet-text {
            border-radius: 5px;
            background-color:#ffffff;
            padding:5px;
            }
            #tweet a {
            text-decoration:none;
            color:9f9f9f;
            }
            #link {
            font-size:8px;
            color:9f9f9f;
            }
            </style>
<img src = "http://pbs.twimg.com/profile_images/506894311955243008/0D63lczz_normal.png"/><a href = "https://twitter.com/STAT545">
@STAT545</a>
<p id="tweet-text">
RT @pgbovine: i'm grateful someone took the effort to write this book,
but OMG THIS LOOKS SO PAINFULLLLLLLL <http://t.co/vKbBqWfGSz>
</p>
<a id = "link" href= "https://twitter.com/STAT545/status/535662091349131265">link</a>

<style>
            #tweet {
            border: 1px solid;
            border-color: #9f9f9f;
            border-radius: 5px;
            background-color:#f1f1f1;
            padding:5px;
            }
            img {
            border-radius: 5px;
            border: 1px solid;
            margin-right:5px;
            }
            #tweet-text {
            border-radius: 5px;
            background-color:#ffffff;
            padding:5px;
            }
            #tweet a {
            text-decoration:none;
            color:9f9f9f;
            }
            #link {
            font-size:8px;
            color:9f9f9f;
            }
            </style>
<img src = "http://pbs.twimg.com/profile_images/506894311955243008/0D63lczz_normal.png"/><a href = "https://twitter.com/STAT545">
@STAT545</a>
<p id="tweet-text">
RT @deaneckles: PhD students: Come spend your summer with the Facebook
Data Science team! <https://t.co/G4XaxxLnEr> See our team here
[https:/…](https:/…)
</p>
<a id = "link" href= "https://twitter.com/STAT545/status/535658893628555265">link</a>

Workflow and Reflections
------------------------

-   The user could face some issues with the twitter api as it does not
    work as expected when asking for the timeline of a certain user. The
    `count` variable is not exactly the number of tweets you would get
    if you exclude retweets, it would only return the non-retweets
    within the last n tweets.
-   There was a number of things that proved difficult to do, the
    authentication used by twitter has changed a lot since the last time
    I used it. This is not exactly encouraging for app developers.
-   I started out by making this package as a wrapper of sorts for the
    twitteR package. Unfortunatley, the twitteR version in CRAN did not
    work, and I had no idea how to import the development version of a
    package into my package. Instead I went for the `httr` package to
    handle http GET requests and twitter authentication and it works
    without obscuring any important details.
-   The authentication works wihtout hiding the consumer or token
    secrets. This is not exactly ideal but there is no other way to do
    it in an open source package that does not invlove too much work.
    The app I'm using here is not really important and it's linked to a
    newly created twitter account, so I though instead of trying to
    solve a well known oauth problem I'll just leave it as is.
-   There's a lot I could add to improve this package; the css can be
    made external instead of internal in the `embedTweet` function, the
    `getUserTimeline` function could use more options, finally I could
    try to add more functions to search and collect tweets. However, for
    our purposes what is there is suffecient and users can always
    manually collect tweets ids and then embed them.
-   Last minute error, for some reason the vignette would fail the
    `devtools::check()` without the `library(funWithTwitter)` call in
    the vignette.
