# R Lab 5

### 1. Написати функцію pmean, яка обчислює середнєзначення(mean) забруднення сульфатами або нітратами серед заданого переліка моніторів. Ця функція приймає три аргументи: «directory», «pollutant», «id». Directory – папка, в якій розміщені дані, pollutant – вид забруднення, id – перелік моніторів. Аргумент id має значення за замовчуванням 1:332. Функція повинна ігнорувати NA значення. 
```
Приклад роботи функції: 
pmean("specdata", "sulfate", 1:10)
## [1] 4.064128 
pmean("specdata", "sulfate", 55)
## [1] 3.587319 
pmean("specdata", "nitrate") 
## [1] 1.702932
```
**Реалізація:**
```R
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
```
**Результат роботи:**
```cmd
> pmean("~/Desktop/Univer/5 курс/R_Python/specdata/", "sulfate", 55)
[1] 3.587319
```

### 2. Написати функцію complete, яка виводить кількість повних спостережень (the number of completely observed cases) для кожного файлу. Функція приймає два аргументи: «Directory» та «id» та повертає data frame, в якому перший стовпчик – ім’я файлу, а другий – кількість повних спостережень. 
````
Приклад роботи функції:
complete("specdata", 1) ## id nobs
##1 1 117
complete("specdata", c(2, 4, 8, 10, 12)) ## id nobs
##1 21041
##2 4 474
##3 8 192 ##410 148 ##512 96
complete("specdata", 50:60) ## id nobs
##1 50 459
##2 51 193
##3 52 812 ##4 53 342 ##5 54 219 ##6 55 372 ##7 56 642 ##8 57 452 ##9 58 391 ##1059 445 ##1160 448
````
**Реалізація:**
```R
complete <- function(directory, id = 1:332) {
    data <- data.frame()
    for (i in id) {
        #Створюємо префікс імені для додавання потірбної кількості нулів до імені файлу 001, 011
        prefix_name <- if (i < 10) "00" else if(i < 100) "0" else ""
        #Отримуємо дані
        f <- read.csv(paste0(directory, "/", prefix_name, as.character(i), ".csv"))

        #Рахуємо суму та додаємо в фрейм дані
        nobs <- sum(complete.cases(f))
        data <- rbind(data, data.frame(i, nobs))
    }
    return(data)
}
```
**Результат роботи:**
```cmd
> complete("~/Desktop/Univer/5 курс/R_Python/specdata/", 1:10)
    i nobs
1   1  117
2   2 1041
3   3  243
4   4  474
5   5  402
6   6  228
7   7  442
8   8  192
9   9  275
10 10  148
```
### 3. Написати функцію corr, яка приймає два аргументи: directory (папка, де знаходяться файли спостережень) та threshold (порогове значення, за замовчуванням дорівнює 0) та обчислює кореляцію між сульфатами та нітратами для моніторів, кількість повних спостережень для яких більше порогового значення. Функція повинна повернути вектор значень кореляцій. Якщо ні один монітор не перевищує порогового значення, функція повинна повернути numeric вектор довжиною 0. Для обчислення кореляції між сульфатами та нітратами використовуйте вбудовану функцію «cor» з параметрами за замовчуванням. 
````
Приклад роботи функції:
cr <- corr("specdata", 150)
head(cr); summary(cr)
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 - 0.07588814
## Min. 1st Qu. Median Mean 3rd Qu. Max.
## -0.21060 -0.04999 0.09463 0.12530 0.26840 0.76310
cr <- corr("specdata", 400)
head(cr); summary(cr)
## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814 0.76312884 - 0.15782860
## Min. 1st Qu. Median Mean 3rd Qu. Max.
## -0.17620 -0.03109 0.10020 0.13970 0.26850 0.76310
cr <- corr("specdata", 5000) head(cr); summary(cr) ; length(cr) ## NULL
## Length Class Mode
## 0 NULL NULL
## [1] 0
````
**Реалізація:**
```R
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

```
**Результат роботи:**
```cmd
> cr <- corr("~/Desktop/Univer/5 курс/R_Python/specdata/", 150); head(cr); summary(cr)
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
    Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
> cr <- corr("~/Desktop/Univer/5 курс/R_Python/specdata/", 5000);head(cr); summary(cr); length(cr)
NULL
Length  Class   Mode 
     0   NULL   NULL 
[1] 0
```
