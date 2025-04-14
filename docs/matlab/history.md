---
title: History of Computing
---

## Introduction
Computation, at its core, involves the processing of data and execution of instructions to solve problems.
From ancient mechanical devices to modern supercomputers, the field of computation has revolutionized how
engineers, scientists, and mathematicians address complex challenges.

Modern engineers often perform computations on personal computers when it is more time-intensive or
more error-prone to do by hand.
Some computations, such as simulating turbulent flows, may grow beyond the limits of a personal computer and require
the use of computer clusters.
Lastly, some computations must be performed remotely, such as a rover navigating on Mars or a rocket steering itself through launch.

## Early Beginnings: Mechanical Computation
The foundations of computation began with mechanical devices designed to aid calculations.
Ancient cultures like the Babylonians and Egyptians used tools such as the abacus for arithmetic tasks.
Farmers would keep track of how many cattle they owned, for example, using the abacus.

A significant leap occurred in 1614, when [John Napier](https://www.britannica.com/biography/John-Napier) invented logarithms.
In the early 1620s, [William Oughtred](https://www.britannica.com/biography/William-Oughtred) invented the slide rule and fundamentally changed the way we performed multiplication, division, exponentiation, trigonometry, and solving the quadratic formula.
Use of the slide rule only declined in the 1970s when they were replaced by handheld calculators.
To learn more about multiplying and dividing with a slide rule, visit [Basic Slide Rule Use](https://efcms.engr.utk.edu/ef105-2024-01/slide_rule_fun.pdf).

Glenn L. Martin Hall, on the University of Maryland College Park campus,
was designed to look like a slide rule from above. ([aerial view](https://hdl.handle.net/1903.1/58268))
{: .notice}

It is worth noting at this point that the abacus adds and subtracts in discrete steps, while the slide rule is continuous.
For example, an abacus cannot add an irrational number (e.g. $$\pi$$) without rounding first.
Slide rules can be used without rounding, limited instead by the user's ability to line up the rules and cursor.
Though this may seem like an advantage for continuous computing machines, discrete machines would overtake them as technology advanced. 
Finer resolution, analogous to having many rows on an abacus for the tenths, hundredths, thousandths, and so on, would make round-off error nearly imperceptible.

<figure class="align-center">
	<a title="Jccsvq, CC0, via Wikimedia Commons" href="https://upload.wikimedia.org/wikipedia/commons/5/58/Traditional_Chinese_abacus_illustrating_the_suspended_bead_use.jpg">
    <img alt="Traditional suanpan (Chinese abacus) illustrating the use of suspended beads" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/58/Traditional_Chinese_abacus_illustrating_the_suspended_bead_use.jpg/512px-Traditional_Chinese_abacus_illustrating_the_suspended_bead_use.jpg"></a>
	<figcaption class="figure-caption text-center">Traditional suanpan (Chinese abacus) illustrating the use of suspended beads.</figcaption>
</figure>

<figure class="align-center">
    <a title="Pearson Scott Foresman, Public domain, via Wikimedia Commons" href="https://upload.wikimedia.org/wikipedia/commons/9/99/Slide_Rule_%28PSF%29.png"><img width="512" alt="Slide Rule (PSF)" src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Slide_Rule_%28PSF%29.png/512px-Slide_Rule_%28PSF%29.png?20200326085333"></a>
    <figcaption class="figure-caption text-center">Diagram showing the use of a slide rule.</figcaption>
</figure>

## The Age of Machines: 17th to 19th Century
While the slide rule accelerated a long list of mathematical operations, addition and subtraction were not on that list.
Decades later in 1642, [Blaise Pascal](https://lemelson.mit.edu/resources/blaise-pascal) invented the Pascaline: a mechanical calculator capable of addition and subtraction.
It used a series of interlocking gears and dials, where each dial represented a digit.
Turning the dials would rotate the gears, calculating sums and differences automatically.

[Gottfried Wilhelm Leibniz](http://ds-wordpress.haverford.edu/bitbybit/bit-by-bit-contents/chapter-one/1-8-leibniz-and-the-stepped-reckoner/)
improved on the Pascaline in 1673 with the invention of the Leibniz wheel.
The wheel was a gear where the teeth had different widths,
so adding a specific number was a matter of sliding the wheel to set how many teeth engaged an axle.
All four fundamental arithmetic operations could be performed with a single Leibniz step reckoner,
a machine with a Leibniz wheel representing each of the tens places.
The stepped reckoner would remain the primary arithmetic machine in use for the next 150 years.

**Image List**
- Pascaline
- Stepped reckoner

The Industrial Revolution enabled mass production of nearly everything, including textiles and arithmetic machines.
In 1804, [Joseph Marie Jacquard](https://www.britannica.com/biography/Joseph-Marie-Jacquard) invented a programmable loom that could weave a wide variety of complex patterns,
with each pattern punched into a sequence of cards.
This improvement in automation, along with several other innovations, lead to significant job losses for skilled textile workers,ignited conflicts across England, and highlighted the impact of automating people's jobs.
In 1820, [Charles Xavier Thomas](http://ds-wordpress.haverford.edu/bitbybit/bit-by-bit-contents/chapter-two/the-arithmometer-and-numerical-tables/)
used the same operating principles as the step reckoner, improving on it with a design that could be mass produced.
His design would not reach the market until 1851, in part due to the British government shifting focus to the difference
engine invented by [Charles Babbage](https://www.britannica.com/biography/Charles-Babbage).

The Babbage [difference engine](https://www.britannica.com/technology/Difference-Engine) was notable for its ability to evaluate polynomials. 
Previously, transcendental functions like sine and cosine were evaluated by looking up values in tables.
The publishers for these tables calculated and recorded values by hand - for a limited number of angles.
It was known for a century by this point that these functions could be approximated by a polynomial series, such as

$$\sin(x) \approx x - \frac{x^3}{3!} + \frac{x^5}{5!} + ...$$

Babbage's difference engine could be set with the coefficients of a polynomial, then evaluated for a specific input value.
Despite his success with the difference engine, Babbage was inspired by Jacquard to develop a programmable machine - one
capable of performing any calculation.
He set to work on the mechanical design of an [analytical engine](https://blogs.bodleian.ox.ac.uk/adalovelace/2018/07/26/ada-lovelace-and-the-analytical-engine/), while [Ada Lovelace](https://www.britannica.com/biography/Ada-Lovelace) wrote instructions for the machine, making her the first programmer.
The significant advancement with the analytical engine was that the output of one calculation could be passed as input to another calculation.
The specific operations performed in each calculation step would be defined using a punch card system,
inspired by the Jacquard looms. 
Though the analytical engine would never be built, the concepts of listing operations and storing values in memory are
fundamental to modern computing.

**Image List**
- Jacquard loom
- Arithmometer
- Difference engine
- analytic engine

The video below demonstrates the working of Babbage's Difference Engine No. 2, an improved design that was never realized until 1991.

{% include video id="0anIyVGeWOI" provider="youtube" %}

## The Rise of Electronic Computing: 20th Century
The early 20th century saw a shift from mechanical to electronic computation. Key milestones include:
- **Alan Turing** (1936): Developed the theoretical framework of computation with the Turing Machine, laying the groundwork for computer science.
- **ENIAC** (1945): The first general-purpose electronic computer, capable of thousands of calculations per second.
- **IBM Model 650** (1953): One of the earliest widely-used computers in engineering applications.

During this time, aerospace engineers began using computation to simulate flight dynamics and analyze structural integrity.

**Suggested Image:** A photograph of the ENIAC computer in operation, with engineers working alongside the machine.


## Computational Power in Engineering: Late 20th Century
The introduction of personal computers in the 1980s democratized access to computation. Engineers adopted software like MATLAB (introduced in 1984) and CAD tools for precision design and analysis.

Parallel computing and supercomputers became instrumental in solving large-scale engineering problems, such as finite element analysis and fluid dynamics simulations for aerospace applications.

**Suggested Image:** A timeline showing the progression of computational tools like MATLAB, CAD software, and supercomputers.


## The Modern Era: 21st Century and Beyond
Modern computation is marked by advancements in artificial intelligence (AI), cloud computing, and quantum computing:
- **AI and Machine Learning:** Used in mechanical and aerospace engineering for predictive modeling and optimization.
- **Cloud Computing:** Enables collaborative simulations and data-intensive computations from anywhere in the world.
- **Quantum Computing:** Offers potential breakthroughs in solving problems like aerodynamic modeling at an unprecedented scale.

Today, engineers leverage computational power to innovate in autonomous systems, spacecraft design, and energy efficiency.

**Suggested Image:** A futuristic rendering of a quantum computer connected to engineering simulations.

## Conclusion
The history of computation is a story of human ingenuity, driven by the desire to solve complex problems efficiently. From ancient mechanical devices to cutting-edge quantum systems, computation continues to empower mechanical and aerospace engineers to push boundaries and explore new frontiers.

**Suggested Image:** A conceptual image of an engineer working in a modern computational environment, with overlays of simulations and calculations.
