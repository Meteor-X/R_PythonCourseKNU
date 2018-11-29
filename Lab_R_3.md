# R_Lab_3

### 1. Функція add2(x, y), яка повертає суму двох чисел.
````R
add2 <- function(x, y) { 
        return (x+y) 
    }
````
### 2. Функція above(x,n),якаприй має вектор та число n,таповертаєвсі елементі вектору, які більше n. По замовчуванню n = 10.
````R
above <- function(x, n = 10) {
        return (x[x > n])
    }
````
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
### 4. Функція columnmean(x,removeNA), якарозраховує середнєзначення (mean) по кожному стовпцю матриці, або data frame. Логічний параметр removeNA вказує, чи видаляти NA значення. По замовчуванню він дорівнює TRUE.
````R
columnmean <- function(x, removeNA = TRUE){
        return (colMeans(m, na.rm = removeNA))
    }
````
