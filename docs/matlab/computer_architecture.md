---
title: Computer Architecture
---

Computer architecture refers to the conceptual design and operational structure of a computer system.
It defines how hardware components interact, how software interfaces with the hardware, and
how instructions are executed to perform tasks.

_A diagram of a basic computer system (often called the Von Neumann architecture) would be helpful here, showing the processor, memory, and input/output devices connected via a system bus._

## Key Components of Computer Architecture
* **Central Processing Unit (CPU):** The CPU, often called the "brain" of the computer, executes instructions and processes data. It consists of:

 + Control Unit (CU): Manages the execution of instructions, directing data flow between components.

 + Arithmetic Logic Unit (ALU): Performs arithmetic and logical operations.

 + Registers: Small, high-speed storage areas within the CPU that temporarily hold data or instructions.

_A diagram of the internal structure of a CPU could clarify the roles of the CU, ALU, and registers._

* **Memory:** Memory is where data and instructions are stored for quick access during processing. There are two main types:

 + Primary Memory (RAM): Volatile memory used for temporary data storage while a program runs.

 + Secondary Memory: Non-volatile storage such as hard drives or SSDs, used to store data permanently.

*A comparison table of primary vs. secondary memory would help emphasize their differences.*

* **Input and Output Devices (I/O):** These devices allow interaction between the user and the computer. Input devices (like keyboards and mice) send data to the computer, while output devices (like monitors and printers) display results.

* **System Bus**: The system bus is a communication pathway that connects the CPU, memory, and I/O devices. It is divided into three types:

 + Data Bus: Carries data.

 + Address Bus: Carries memory addresses.

 + Control Bus: Carries control signals.

*A flow diagram of the system bus and its connections would illustrate its role effectively.*

## Instruction Cycle: How Computers Work
The instruction cycle, also known as the fetch-decode-execute cycle, describes how a CPU processes instructions. It operates in three main steps:

1. Fetch: The CPU retrieves an instruction from memory.

2. Decode: The control unit interprets the instruction.

3. Execute: The CPU performs the instruction, which might involve calculations or data transfer.

*A step-by-step flowchart of the instruction cycle would be beneficial to visualize these stages.*

## Types of Computer Architecture
1. Von Neumann Architecture: This traditional architecture uses a single memory for both instructions and data. It is simple but can be slower due to shared memory access.

2. Harvard Architecture: This design separates memory for instructions and data, allowing simultaneous access and improving speed.

*A side-by-side diagram comparing Von Neumann and Harvard architectures would clearly highlight their differences.*

## Performance and Parallelism
Modern computers employ techniques like pipelining, caching, and multicore processors to enhance performance:

* Pipelining: Overlaps instruction cycles to execute multiple instructions simultaneously.

* Caching: Uses small, fast memory near the CPU to store frequently accessed data.

* Multicore Processors: Combine multiple CPUs on one chip to handle tasks in parallel.

*A diagram of a multicore processor could demonstrate how parallelism boosts performance.*

Computer architecture is the backbone of modern computing, connecting hardware and software to create powerful and efficient systems.
The core components of the CPU, memory, and system bus, along with the principles behind performance optimization, are essential
to the design of computers in a variety of use cases - whether it's for a drone, a launch vehicle, or something in between.
This course focuses on programming on a personal computer, however the concepts are applicable to computers within robots, vehicles, and many more systems in the modern world.
