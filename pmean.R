complete <- function(directory, id = 1:332) {
    data <- data.frame()
    for (i in id) {
        #Створюємо префікс імені для додавання потірбної кількості нулів до імені файлу 001, 011
        prefix_name <- if (i < 10) "00" else if(i < 100) "0" else ""
        #Отримуємо дані
        f <- read.csv(paste0(directory, "/", prefix_name, as.character(i), ".csv"))

        #Рахуємо суму та додаємо дані в фрейм
        nobs <- sum(complete.cases(f))
        data <- rbind(data, data.frame(i, nobs))
    }
    return(data)
}

pmean <- function(directory, pollutant, id = 1:332) {
    data <- data.frame()
    for (i in id) {
        #Створюємо префікс імені для додавання потірбної кількості нулів до імені файлу 001, 011
        prefix_name <- if (i < 10) "00" else if(i < 100) "0" else ""
        #Отримуємо дані
        f <- read.csv(paste0(directory, "/", prefix_name, as.character(i), ".csv"))
        #Додаємо дані в фрейм
        data <- rbind(data,f)
    }
    return (mean(data[,pollutant], na.rm = TRUE))
}

corr <- function(directory, threshold = 0) {
    corr_vect <- NULL

    for (i in 1:332) {

        #Створюємо префікс імені для додавання потірбної кількості нулів до імені файлу 001, 011
        prefix_name <- if (i < 10) "00" else if(i < 100) "0" else ""
        #Отримуємо дані
        f <- read.csv(paste0(directory, "/", prefix_name, as.character(i), ".csv"))
        data <- f[complete.cases(f),]

        #Перевіряємо поріг та знаходимо і зберігаємо кореляцію
        if (nrow(data) > threshold)
        corr_vect <- c(corr_vect, cor(data[,"sulfate"], data[, "nitrate"]))
    }
    if(length(corr_vect) > 0)
    return (corr_vect)
    return (c())
}
