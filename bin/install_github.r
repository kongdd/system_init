#! /usr/bin/env -S Rscript --no-init-file

server <- "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"
# server <- "https://mirrors.aliyun.com/CRAN/"
local({
    r <- getOption("repos")
    r["CRAN"] <- server
    options(repos = r)
})
# .libPaths("/mnt/e/WSL/r_library")

args <- commandArgs(TRUE)
# print(args)
# destdir <- normalizePath("~/Downloads/r-pkgs/")
destdir <- paste0(dirname(.libPaths()[1]), "/r-pkgs")
if (!dir.exists(destdir)) dir.create(destdir, recursive = TRUE)

if (!require(wget)) {
    devtools::install_github("rpkgs/wget", destdir = destdir)
}
res <- try(devtools::install_github(args, destdir = destdir))
