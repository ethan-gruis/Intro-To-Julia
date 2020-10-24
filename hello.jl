print("Hello! This is Ethan!")

2+2

# General Notes:
#   To run in line: alt + Enter
#   To run a Code Cell: shift + Enter

## this is a code cell
println("Hello, This is inside the code cell")
println("This is Ethan")
##


###############################################################################
#                           Lesson 1 - Variables and Types                    #
###############################################################################
## Var Cell 1
my_name = "Ethan"
my_favorite_number = 7
my_favorite_pie = 3.1415926

print(my_name)
## 


## Var Cell 2 
a = 2
b = 3
sum = a + b 
difference = a - b 
product = a * b
quotient = b / a
power = a^3
modulus = b % a 
## 

## How To Get Types
typeof(0.1)

typeof(42)

typeof("Ethan")
##

a = 2 # if we need to operate with ints
b = 2.0 # if we need to operate with floats 

a
b

################################################################################
#                             Lesson 2 - Functions                             #
################################################################################

# Long form 
function plus_two(x)
    # perform some operations
    return x + 2 
end

# Short form 
plus_three(x) = x + 3

# Anonymous functions (like lambdas)
plus_four = x -> x+4 
# not recommended to use anonymous functions unless they are really simple 

using Pkg
Pkg.add("QuadGK")
using QuadGK

f(x,y,z) = (x^2 + 2y)*z 

# short form 
quadgk(x->f(x,42,4), 3, 4)

# Long form 
##
f(x,y,z) = (x^2 + 2y)*z
arg(x) = f(x,42,4)

quadgk(arg,3,4)
##


# Void Functions
function say_hi() 
    println("Hello from Ethan!")
    return
end
#   if its void, the return can be omitted, but its good form to always explicitly
#   return something / show youre not returning anything


# Optional Positional Arguments
function myWeight(weightOnEarth, g = 9.81)
    return weightOnEarth*g/9.81
end 

myWeight(60)

myWeight(60, 3.72)

# Keyword Arguments
function my_long_function(a, b = 2; c, d = 3)
    return a + b + c + d 
end

my_long_function(1, c = 3)

my_long_function(1, 2, d = 5, c = 3)
#   specify arguments by calling variable names in call 
#   my_long_function(1, 2, d=5) - doesn't work bc c not assigned 

#   positional arguments help with performance 
"""
Description of the function 
"""
function foo(x) 
    #... function implementation
end 


################################################################################
#                             Lesson 3 - Data structures                       #
################################################################################

# Vectors
#   "A vector is a list of ordered data which share a common type
a = [1,2,3,4,5,]
b = [1.2, 3,4,5]
c = ["Hello", "it's me", "Ethan"]

# J ulia is a 1-based index language 
a[1]
b[1]
c[1]

append!(b, 3.14)
#   append works in place, and changes the vector in memory

typeof(a)

d = Int[1,2,3,4,5]

# Matrices
#   "Matrices are two dimensional arrays. We can define a matrix with the following syntax:"
mat1 = [1 2 3; 4 5 6]

#   to access the elements of a matrix, we use the following notation:
mat1[2, 1]

# N-dimensional arrays
#   Sometimes we need to create tables with more than 2 dimensions. Ex: a 2x3x4 table
table = zeros(2,3,4)
for k in 1:4
    for j in 1:3
        for i in 1:2
            table[i,j,k] = i*j*k 
        end
    end 
end

table
#   **Important to note** : Julia stores values in memory differently from Python
#       In Julia to obtain fast loops we need to iterate first over columns

# Slicing 
mat1 = reshape([i for i in 1:16],4,4)
mat2 = mat1[2:3, 2:3]

# Views
#   Arrays are pointers to location in memory
a = [1,2,3]
b = a
b[2] = 42
print(a)

#   If we want to make a copy of an array we need to use the function copy
a = [1,2,3]
b = copy(a)
b[2] = 42

print(a)

print(b)

# Tuples
#   A tuple is a fixed size group of variables which may share a common type but don't need to
a = (1,2,3)
b = 1, 2, 3

tuple1 = (1,2,3)
a, b, c = tuple1

print("$a $b $c")

# good to use tuples to emulate multiple return values from functions:
function return_multiple()
    return 42, 43, 44
end 

a, b, c = return_multiple()
print("$a $b $c")

# Splatting
#   It is possible to "unpack" a tuple and pass its arguments to a function with the following syntax:
function splat_me(a,b,c)
    return 42, 43, 44
end  

tuple1 = (1,2,3)

#   must use elipses to splat 
splat_me(tuple1...)

# Named tuples 
namedTuple1 = (a = 1, b = "hello")

namedTuple2 = NamedTuple{(:a, :b)}((2, "hello2"))
namedTuple2[:b]

# Dictionaries 
person1 = Dict("Name" => "Aurelia", "Phone" => 1234567890, "Shoe-size" => 11)
person2 = Dict("Name" => "Ethan", "Phone" => 1234567890, "Shoe-size" => 10)

addressBook = Dict("Aurelio" => person1, "Elena" => person2)

person3 = Dict("Name" => "Victoria", "Phone" => 1234567890, "Shoe-size" => 9)
addressBook["Victoria"] = person3

######################################################################################################
#                                        Lesson 4 - Control Flow                                     #
######################################################################################################

# If ... else 
function absolute(x) 
    if x >= 0
        return x 
    else 
        return -x 
    end 
end 

if 1 < 3 & 3 < 4
    print("eureka!")
end

x = 42
if x < 1
    print(x)
elseif x < 3
    print("no")
else
    print("100")
end

#   String interpolation
name1 = "traveler"
name2 = "ethan"
print("Welcome $name1, this is $name2")

for i in 1:10
    println(i^2)
end

persons = ["Alice", "Bob", "Carla", "Daniel"]

for person in persons
    println("Hello $person, welcome to Ethan")
end

#   Break statements 
for i in 1:100
    if i > 10
        print("END")
        break
    else
        println(i^2)
    end
end

#   Continue 
for i in 1:30
    if i % 3 == 0
        continue
    else 
        println(i)
    end
end

function while_test() 
    i = 0
    while(i<30)
        println(i)
        i += 1
    end
end

x = ["a", "b", "c"]
for couple in enumerate(x) 
    println(couple)
end

x = ["a", "b", "c"]
enum_array = [(1, "a"), (2, "b"), (3, "c")]
for i in 1:length(x) 
    println(enum_array[i])
end

my_array1 = collect(1:10)
my_array2 = zeros(10)
for (i, element) in enumerate(my_array1)
    my_array2 = element^2
end

print(my_array2)

######################################################################################################
#                                       Lesson 5 - Broadcoasting                                     #
######################################################################################################
a = [1,2,3]
b = [4,5,6]

c = [4 5 6]

c*a

d = reshape([1,2,3,4,5,6,7,8,9],3,3)
d*a

######################################################################################################
#                                      Lesson 6 - Variable Scope                                     #
######################################################################################################
# Scope 
#   - A variable in the global scope is accessible everywhere in the program and can be modified by any
#     part of the code 
#   - A variable in a local scope is only accesible in that scope and in other scopes eventually defined
#     inside it 

# Constants
const C = 1001020202
C = 1
C = 2.98
#   constants can be changed within the value of their own data type, but the data type cannot be changed

# Modules 
#   basically a library
module ScopeTestModule 
export a1 
a1 = 25
b1 = 42 
end 

using .ScopeTestModule
#   orks since a1 was exported into scope 
a1

#   Can access variables that aren't exported like so 
ScopeTestModule.b1
#   but can't assign variables 
ScopeTestModule.b1 = 10

######################################################################################################
#                                         Lesson 7 - Modules                                         #
######################################################################################################
# Working with modules 
#    Libraries in Julia come in the form of module which can be loaded via wthe "using" notation 
using Pkg
Pkg.add("SpecialFunctions")

using SpecialFunctions 

gamma(3)

sinint(5) # sine integral 

# Defining your own Modules
## 
module MyModule 
export func2

a=42
function func1(x)
    return x^2 
end 

function func2(x) 
    return func1(x) + a
end 

end # end of module 
##


using .MyModule 

func2(3)

func1(3)

MyModule.func1(3)

# including 
include("big-module.jl") 

using .MyBigModule

MyBigModule.func2big(3)

"""
Description of the function 
""" 
function foo(x) 
    # ... function implementation 
end


######################################################################################################
#                                       Lesson 8 - Types                                             #
######################################################################################################

# Use type or struct keywords to declare an abstract type 
abstract type Person 
end

abstract type Musician <: Person 
end

mutable struct Rockstart <: Musician 
    name::String
    instrument::String
    bandName::String 
    headbandColor::String
    instruments::Int 
end

struct ClasssicMusician <: Musician 
    name::String 
    instrument::String 
end 

mutable struct Physicist <: Person 
    name::String 
    sleepHours::Float64
    favouriteLanguage::String 
end

aure = Physicist("Aurelio", 6, "Julia")

aure.name

aure.sleepHours = aure.sleepHours + 1

function introduceMe(person::Person)
    println("hello, my name is $(person.name).")
end

introduceMe(aure)

# Plots
using Pkg 
Pkg.add("Plots")

using Plots
##
gr()

x = 1:0.01:10*π
y = sin.(x)

plot(x,y, label="sin(x)")
plot!(xlab="x", ylab="f(x)")
##

##
plotly()
x=1:0.1:3*π
y=1:0.1:3*π

xx = reshape([xi for xi in x for yj in y],  length(y), length(x))
yy = reshape([yj for xi in x for yj in y],  length(y), length(x))
zz = sin.(xx).*cos.(yy)
plot3d(xx,yy,zz, label=:none, st = :surface)
plot!(xlab="x", ylab="y", zlab="sin(x)*cos(y)")
savefig("img2")
##

using Pkg
Pkg.add("PyCall")
using PyCall