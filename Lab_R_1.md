# R_Lab_1
### 1. Створити змінні базових (atomic) типів. Базові типи: character, numeric, integer, complex, logical.
````R
 > ch <- "text";
 >  class(ch)
 [1] "character"
 >  
 >  n <-1.0
 >  class(n)
 [1] "numeric"
 > 
 >  i <- 1L;
 >  class(i)
 [1] "integer"
 >  
 >  compl <- as.complex(2+2i)
 >  class(compl)
 [1] "complex"
 > 
 >  logical <- TRUE;
 >  class(logical)
 [1] "logical"
````

### 2. Створити вектори, які: містить послідовність з 5 до 75; містить числа 3.14, 2.71, 0, 13; 100 значень TRUE.
````R
v_1<-5:75
v_2<-c(3.14, 2.71, 0, 13)
v_3<-as.logical(c(1:100))
````

### 3. Створити наступну матрицю за допомогою matrix, та за допомогою cbind або rbind
````R
m <- rbind(c(0.5, 1.3, 3.5), c(3.9, 131,2.8), c(0, 2.2,4.6), c(2,7,5.1))
````
### 4. Створитидовільнийсписок(list),вякийвключитивсібазовітипи.
````R
list<- list(ch,n, i, compl, logical)
````
### 5. Створитифакторзтрьомарівнями«baby»,«child»,«adult».
````R
 f<- factor(c("baby", "child", "adult"),)
````
### 6. Знайти індекс першого значення NA в векторі 1,2,3,4,NA,6,7,NA,9,NA,11. Знайти кількість значень NA.
````R
na_l <-list( 1, 2, 3, 4, NA, 6, 7, NA, 9, NA, 11)
  counter_na <- function(x){
    c<- 0;
    p<- -1;
    index <-0
    for(item in x){
      index<- index+1
      if(is.na(item)){
        c <- c+1
        if(p == -1)
          p<- index
      }
        
    }
    
    
    c(c,p)## кількість, позиція першого
  }
  counter_na(na_l)
````

### 7. Створити довільний data frame та вивести в консоль.
````R
  df <- data.frame(c_1 = 1:4, c_2 = c(T, T, F, F)) 
  df
````
### 8. Змінити імена стовпців цього data frame.
````R
  names(df)[1] <- 'New name 1 col'
````