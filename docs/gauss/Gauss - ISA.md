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

- Instructions are encoded in 24 bits.

### Store Number Into a Matrix

```text
  [  0001  ] [ XXXX ] [ XXXX ] [ XXXX ] [ XXXX_XXXX ]
    OPCODE      Ma       La       Ca        DATA
```

### Read Number From a Matrix

```text
  [  0010  ] [ XXXX ] [ XXXX ] [ XXXX ] [ XXXX_XXXX ]
    OPCODE      Ma       La       Ca        DATA
```

### Sum Two Matrices

```text
  [  0011  ] [ XXXX ] [ XXXX ] [ XXXX ]
    OPCODE     Ma_A     Ma_B     Ma_R   
```

### Subtract Two Matrices

```text
  [  0100  ] [ XXXX ] [ XXXX ] [ XXXX ] 
    OPCODE     Ma_A     Ma_B     Ma_R   
```

### Multiply Two Matrices

```text
  [  0101  ] [ XXXX ] [ XXXX ] [ XXXX ] 
    OPCODE     Ma_A     Ma_B     Ma_R   
```

### Multiply a Matrix by a Scalar

```text
  [  0110  ] [ XXXX ] [ XXXX_XXXX ] [ XXXX ] 
    OPCODE     Ma_A        E          Ma_R   
```

### Find the Determinant of a Matrix

```text
  [  0111  ] [ XXXX ] [ XXXX_XXXX ] 
    OPCODE     Ma_A         E      
```

### Transpose a Matrix

```text
  [  1000  ] [ XXXX ] [ XXXX ] 
    OPCODE      MA       MR      
```

### Find the Inverse of a Matrix

```text
  [  1001  ] [ XXXX ] [ XXXX ] 
    OPCODE      MA       MR      
```
