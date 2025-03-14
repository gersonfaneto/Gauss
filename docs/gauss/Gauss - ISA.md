# Gauss - ISA

## Observations

- Operations are only supported between square matrices of size `N`, where:

    $$
         N \le 5
    $$

- Each element of a given matrix `M` is an `integer` of size 8 bits.

- The coprocessor implements _paralelism_ to optmize the execution of the
  operations.

- The architecture is based on a _pipeline_ to make the processes more
  eficient.

## Instructions & Operations

- There are currently 9 instructions implemented:

    ...

- Instructions are encoded in XX bits.

### Store Number Into a Matrix

```text
  [  0001  ] [ XXXX ] [ XXXX ] [ XXXX ] [ XXXX_XXXX ]
    OPCODE      Ma       La       Ca        DATA
```

### Read Number From a Matrix

...

### Sum Two Matrices

...

### Subtract Two Matrices

...

### Multiply Two Matrices

...

### Multiply a Matrix by a Scalar

...

### Find the Determinant of a Matrix

...

### Transpose a Matrix

...

### Find the Inverse of a Matrix

...
