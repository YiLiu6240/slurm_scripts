script_ptm = proc.time()

library("tidyverse")
library("getopt")
library("parallel")

spec = matrix(c(
                "n_cores", "n", 2, "integer"
                ), byrow=TRUE, ncol=4)
opt = spec %>% getopt()

n_cores = 1
if (!is.null(opt$n_cores))
    n_cores = opt$n_cores
cat(sprintf("n_cores: %s\n", n_cores))
options(mc.cores=n_cores)

func = function(x) {
    cat(sprintf("x: %s\n", x))
    Sys.sleep(5)
}

mclapply(1:4, func)

cat("elapsed:\n")
print(proc.time() - script_ptm)
