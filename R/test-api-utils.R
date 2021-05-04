test_api_start <- function(api_file = "api1.R",
                           port = 1212,
                           root_folder = system.file(package = "packagedapis")
                           ) {
  api_path <- paste(root_folder, api_file, sep = "/")
  rs <- callr::r_session$new()
  rs$call(function(ap, prt) {
    ar <- plumber::plumb(ap)
    plumber::pr_run(ar, port = prt, docs = FALSE)
  },
  args = list(ap = api_path, prt = port)
  )
  list(
   port = port,
   r_session = rs
  )
}

test_api_stop <- function(api_session) {
  api_session$r_session$close(grace = 0)
}

test_api_endpoint_GET <- function(endpoint, api_session, query = NULL) {
  url_path <- paste0("http://127.0.0.1:", api_session$port)
  callr::r_safe(function() 1)
  callr::r_safe(function(ur, enp, qry) 
    httr::GET(url = ur, path = enp, query = qry),
    args = list(ur = url_path, enp = endpoint, qry = query)
    )  
}


