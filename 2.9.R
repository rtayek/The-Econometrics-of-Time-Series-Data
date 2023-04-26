set.seed(30)
y <- tsibble(sample = 1:50, wn = rnorm(50), index = sample)
y |> autoplot(wn) + labs(title = "White noise", y = "")

us_retail_employment |>
    model(
        STL(Employed ~ trend(window = 7) +
                season(window = "periodic"),
            robust = TRUE)) |>
    components() |>
    autoplot()
