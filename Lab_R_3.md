# R_Lab_3

### 1. Функція add2(x, y), яка повертає суму двох чисел.
````R
add2 <- function(x, y) { 
        return (x+y) 
    }
````
```cmd
> add2(1,234234)
[1] 234235
```
### 2. Функція above(x,n),якаприй має вектор та число n,таповертаєвсі елементі вектору, які більше n. По замовчуванню n = 10.
````R
above <- function(x, n = 10) {
        return (x[x > n])
    }
````
```cmd
> above(0:10,5)
[1]  6  7  8  9 10
```
### 3. Функція my_ifelse(x,exp,n),яка приймає вектор x,порівнюєвсійого елементи за допомогою exp з n, та повертає елементи вектору, які відповідають умові expression. Наприклад, my_ifelse(x, “>”, 0) повертає всі елементи x, які більші 0. Exp може дорівнювати “<”, “>”, “<=”, “>=”, “==”. Якщо exp не співпадає ні з одним з цих виразів, повертається вектор x.
````R
my_ifelse <- function(x, exp, n){
        if (exp == "<") 
            return (x[x < n])
        else if (exp == ">") 
            return (x[x > n])
        else if (exp == "<=")
            return (x[x <= n])
        else if (exp == ">=")
            return (x[x >= n])
        else if (exp == "==")
            return (x[x == n])
        return (x)
    }
````
```cmd
> my_ifelse(1:10,'<=',3)
[1] 1 2 3
> my_ifelse(1:10,'>',3)
[1]  4  5  6  7  8  9 10
> my_ifelse(1:10,'>=',4)
[1]  4  5  6  7  8  9 10
> my_ifelse(1:10,'<=',1)
[1] 1
> my_ifelse(1:10,'=',3)
 [1]  1  2  3  4  5  6  7  8  9 10
> my_ifelse(1:10,'==',3)
[1] 3
```
### 4. Функція columnmean(x,removeNA), якарозраховує середнєзначення (mean) по кожному стовпцю матриці, або data frame. Логічний параметр removeNA вказує, чи видаляти NA значення. По замовчуванню він дорівнює TRUE.
````R
columnmean <- function(x, removeNA = TRUE){
        return (colMeans(x, na.rm = removeNA))
    }
````
```cmd
> columnmean(rbind(c(0.5, 1.3, 3.5), c(3.9, 131,2.8), c(0, 2.2,4.6), c(2,7,5.1)))
[1]  1.600 35.375  4.000
```
