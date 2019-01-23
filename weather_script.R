#skrypt czyta dane dotyczące danych pogodowych i zapisuje je w pliku *.txt na dysku lokalnym

tryCatch(library(rjson),
         error = function(e){install.packages("C:/R/packages/rjson_0.2.20.zip",
                                              repos = NULL, type = "win.binary");
           library(rjson)})

json_file <- "https://danepubliczne.imgw.pl/api/data/synop"


json_data <- rjson::fromJSON(file = json_file)

tmp <- as.data.frame(do.call(rbind, json_data))

for (j in 1:ncol(tmp)) tmp[, j] <- as.character(tmp[, j])

write.table(tmp, file = "C:\\R\\useful_R_scripts_ideas\\weather_data\\weather_data.txt",
            sep = "\t", row.names = FALSE, append = TRUE, quote = FALSE, col.names = FALSE)

# colnames:
# c('id_stacji','stacja','data_pomiaru','godzina_pomiaru','temperatura','predkosc_wiatru',
# 'kierunek_wiatru','wilgotnosc_wzgledna','suma_opadu','cisnienie')