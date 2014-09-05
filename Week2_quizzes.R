library(httr)

oauth_endpoints("github")

myapp <- oauth_app("github", "79670695050b1b6b9255", "08be5ffb127247b0ba7a1c692b955d5271f724b3")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)

homeTL = GET("https://api.github.com/users/jtleek/repos", gtoken)

json1 = content(homeTL)

json2 = jsonlite::fromJSON(toJSON(json1))
head(json2)

small_df <- json2[, c("created_at", "name") ]