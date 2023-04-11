pn <- function(format="", ...) { # print
    s=sprintf(fmt=format,...)
    cat(s)
}
p <- function(format="", ...) { # priint line
    s=pn(format,...)
    cat(s,"\n")
}
