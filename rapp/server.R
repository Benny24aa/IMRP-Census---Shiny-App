function(input, output) {
  source(file.path("Information Page Scripts/information page server.R"), local = TRUE)$value
  source(file.path("data prep/Active War/Active War KD Server.R"), local = TRUE)$value
  
}