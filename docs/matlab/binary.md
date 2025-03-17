---
title: Binary
---

## Introduction
The binary system is a method of representing numbers using only two symbols: 0 and 1.
Unlike the decimal system, which uses ten digits (0–9) to represent numbers, binary uses only these two states.
Binary is a base-2 system, meaning each digit, or "bit," represents a power of 2.

For example, binary 101 equals decimal 5 because $1 \cdot 2^2 + 0 \cdot 2^1 + 1 \cdot 2^0 = 4 + 0 + 1 = 5$.

{% include figure popup=true image_path="/assets/images/binary_number.png" alt="Conversion from binary to decimal" caption="Conversion of binary number to decimal. Image credit: Micromelon Robotics." %}

## Converting Binary to Decimal

## Converting Decimal to Binary

## Floating Point Numbers

## Why Binary in Computers?
Computers use binary because they operate on electrical signals, which have two distinct states: on and off.
Either current is flowing or it is not.
These states can easily be represented as 1 (on) and 0 (off) in binary.
This simplicity allows for reliable data representation and processing within electronic circuits.

## How Computers Use Binary
1. Data Representation: Every piece of data in a computer — whether it's text, images, audio, or video—is ultimately stored as binary numbers. For example:

 * A single character, like 'A', is represented by a binary code using standards such as ASCII. 'A' in ASCII is 01000001. The table below shows the decimal and binary representations for all capital letters in ASCII.

| Letter | Decimal | Binary     |
|--------|---------|------------|
| A      | 65      | 01000001   |
| B      | 66      | 01000010   |
| C      | 67      | 01000011   |
| D      | 68      | 01000100   |
| E      | 69      | 01000101   |
| F      | 70      | 01000110   |
| G      | 71      | 01000111   |
| H      | 72      | 01001000   |
| I      | 73      | 01001001   |
| J      | 74      | 01001010   |
| K      | 75      | 01001011   |
| L      | 76      | 01001100   |
| M      | 77      | 01001101   |
| N      | 78      | 01001110   |
| O      | 79      | 01001111   |
| P      | 80      | 01010000   |
| Q      | 81      | 01010001   |
| R      | 82      | 01010010   |
| S      | 83      | 01010011   |
| T      | 84      | 01010100   |
| U      | 85      | 01010101   |
| V      | 86      | 01010110   |
| W      | 87      | 01010111   |
| X      | 88      | 01011000   |
| Y      | 89      | 01011001   |
| Z      | 90      | 01011010   |

2. Logic and Operations: Binary is the foundation of logic gates, which are the building blocks of a computer's processor. Logic gates perform operations like AND, OR, and NOT using binary input.

 * The AND gate outputs 1 only if both inputs are 1.
 * The OR gate outputs 1 if at least one input is 1.
 * The NOT gate outputs 1 if the input is 0.

3. Storage: Binary is also used in computer memory. A bit is the smallest unit of data, and groups of 8 bits form a byte, which is the standard unit for storing information. The letters in the above ASCII table all use 8 bits. Therefore, each letter is a single byte. Similarly, integers can be stored in several common multiples of 8 bits. Using 32 and 64 bits are common, however this is entirely dependent on the use case. For example, a quadrotor drone has 4 rotors, so only 2 bits are necessary to identify a rotor.

4. Arithmetic Operations: Computers perform calculations in binary. For example, adding two binary numbers like 101 and 011 follows the same rules as decimal addition, with carryovers:

```text
    101
  + 011
  -----
   1000
```

## The Importance of Binary
The binary system is fundamental to the operation of modern mechanical and aerospace engineering systems.
From controlling the precise movements of robotic arms in manufacturing to managing the complex navigation systems of spacecraft, binary enables reliable communication between software and hardware.
For example, binary data streams are critical in processing sensor readings and executing control algorithms in real-time, ensuring that engines operate efficiently or that an aircraft adjusts its flight path accurately.
By understanding binary, engineers gain insight into how digital signals translate into physical actions, forming the foundation for innovation in these advanced fields.
