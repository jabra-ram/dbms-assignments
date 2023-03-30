
# Normalization Assignment
### Question 1
Determine the highest normal form of this relation scheme.
The relation scheme student Performance (StudentName, CourseNo, EnrollmentNo, Grade) has
the following functional dependencies:

StudentName, courseNo → grade

EnrollmentNo, courseNo → grade

StudentName →EnrollmentNo

EnrollmentNo →StudentName

### Answer
(EnrollmentNo, courseNo)<sup>+</sup> = `{EnrollmentNo, courseNo, StudentName, grade}`

(StudentName, courseNo)<sup>+</sup> = `{EnrollmentNo, courseNo, StudentName, grade}`

candidate keys = `{EnrollmentNo, courseNo}`, `{StudentName, courseNo}`
- The schema is in 1NF as there is no multivalued attribute.
- The schema is in 2NF as there is no partial functional dependency.
- The schema is in 3NF as there is no transitive dependency.
- The schema is not in BCNF normal form as StudentName is not superkey in functional dependency `StudentName → EnrollmentNo`.

The highest normal form of schema is 3NF.

### Question 2
Suppose you are given a relation R= (A, B, C, D, E ) with the following functional
dependencies:
`{CE →D, D→B, C →A}`

a. Find all candidate keys.

b. Identify the best normal form that R satisfies (1NF, 2NF, 3NF, or BCNF).

c. If the relation is not in BCNF, decompose it until it becomes BCNF. At each step, identify a
new relation, decompose and re-compute the keys and the normal forms they satisfy.

### Answer
**(a)**

(c,e)<sup>+</sup> = `{c,e,a,d,b}`

candidate key = `{c,e}`

There is only 1 candidate key.

**(b)**

- The schema is in 1NF as there is no multivalued attribute(no data is provided).
- The schema is not in 2NF as there is a partial functional dependency (C → A).

The highest normal form of schema is 1NF.

**(c)**

The relation `R(A, B, C, D, E)` in 1NF.

We can decompose it to `R1(B, C, D, E)` and `R2(C, A)` to make it in 2NF.

Now, `R2(C, A)` is in BCNF with FD: `{ C -> A }` and C as the primary key.

and `R1(B, C, D, E)` is in 2NF and has FD: `{ CE -> D, D -> B }` but not in 3NF

Further dividing R1 into `R3(C, D, E)` with FD: `{ CE -> D }` and `R4(B, D)` with FD: `{ D -> B }` to make it in 3NF.

Now, `R3(C, D, E)` is in BCNF because in FD `{CE -> D}`, CE is a candidate key.

and, `R4(B, D)` is in BCNF because in FD `{D -> B}`, D is a candidate key.

### Question 3
You are given the following set F of functional dependencies for relation R(A, B, C, D, E, F):
F=`{ABC →D, ABD→E,CD→F,CDF →B,BF →D}`

a. Find all keys of R based on these functional dependencies.

b. Is this relation in Boyce-Codd Normal Form? Is it 3NF? Explain your answers

### Answer
**(a)**

(A,B,C)<sup>+</sup> = {A,B,C,D,E,F}

(A,C,D)<sup>+</sup> = {A,B,C,D,E,F}

Candidate keys:

`{A,B,C}`, `{A,C,D}`

Super Keys:

`{A,B,C}`, `{A,C,D}`, `{A,B,C,D}`, `{A,B,C,E}`, `{A,B,C,F}`, `{A,C,D,E}`,`{A,C,D,F}`, `{A,B,C,D,E}`,
`{A,B,C,D,F}`, `{A,C,D,E,F}`, `{A,B,C,E,F}`,`{A,B,C,D,E,F}`

**(b)**

The relation is not in Boyce-Codd Normal Form and not in 3NF as it is not in 2NF.
The relation is not in 2NF because of partial dependency `CD→F`.

### Question 4

Write the advantages and disadvantages of normalization.

### Answer
Advantages 
- Normalization reduces the unnecessary redundant data.
- Data integrity is easily maintained within the database.
- It makes database and application design processes much more flexible.

Disadvantages
- Difficult and expansive.
- It requires a detailed database design.


### Question 5
Determine the decomposition.
Consider the schema R = (S T U V) and the dependencies S → T, T → U, U → V, and V → S.
Let R = (R1 and R2) be a decomposition such that R1 ∩ R2 ≠ ∅

### Answer
S<sup>+</sup> = `STUV`

T<sup>+</sup> = `STUV`

U<sup>+</sup> = `STUV`

V<sup>+</sup> = `STUV`

All the attributes of the relation `R` are candidate keys.

We can perform lossless decomposition of the relation `R` into `R1(S, T, U)` 
and `R2(S, V)`. Clearly, `R1 ∩ R2 ≠ ∅` because `R1 ∩ R2 = U` .