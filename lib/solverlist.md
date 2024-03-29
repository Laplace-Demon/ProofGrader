对于用关系运算符连接的一串表达式，ProofGrader 内部使用不同的 solver 来判断每个关系运算符的两端是否按照一定的规则进行化简，一个 solver 即对应了一种化简规则。因此用户的推导过程仅应包含 solver 支持的步骤。

- 多项式规则(sol_poly_check)：多项式中的一步推导可以使用多次加法交换律、加法结合律、乘法交换律、乘法结合律以及乘法分配律，并且数字运算、同类项合并和根号的化简也被成功识别。在没有额外条件的情况下，不等关系仅会根据表达式本身的结构进行判定（整数的比较、绝对值非负、偶数次方和偶数次开方非负等）。例如:
$$ 1 + \sqrt{ab + 1} * \sqrt{ab - 1} = ba  $$
$$ 1 -|x| \le 1 $$

- shape分解规则(sol_rational_shape)：有理式的一步推导中分子和分母均应遵循多项式的化简规则。在进行判定时分子和分母会分别被比较。例如：
$$ \frac{x ^ 2 - 2x + 1 }{x ^ 2 + 3x + 2} = \frac{(x - 1) ^ 2}{(x + 1)(x + 2)} $$

- 有理式规则(sol_rational_check)：有理式的一步推导中分子和分母均应遵循多项式的化简规则。除此之外分子和分母也可以同时乘以一个相同的表达式或是消去一个相同的表达式。例如：
$$ \frac{1}{\sqrt{x + 2} - \sqrt{x - 2}} = \frac{\sqrt{x + 2} + \sqrt{x - 2}}{4} $$

- 绝对值消去规则(sol_abs)：一步推导可以消去一个或多个绝对值并按照其他化简规则进行后续运算。如果绝对值内部表达式的符号不能由其本身的结构得到，用户需要事先给出其证明(目前好像不行)。例如：
$$ |2\pi| = 2\pi $$

~~|2| * |x + y| = 2x + 2y \; (已事先证明 x + y 非负)~~, 目前似乎并不支持根据前提消去绝对值

- 子结构化简规则(sol_term_simpl, local_detect_solver)：一步推导可以同时对互不关联的一个或多个子结构进行化简，同时每个子结构均应遵循相应的化简规则。例如：
$$ \lim_{x \rightarrow 1}{(\frac{x}{2} + \frac{x}{2})} - |\frac{y}{2} + \frac{y}{2}| + \sin{(\frac{z}{2} + \frac{z}{2})} = \lim_{x \rightarrow 1}{x} - |y| + \sin{z} $$

- 不等式判定规则(sol_replace, sol_final)：在进行不等式推导时，在没有额外条件的情况下，一步推导可以将一个子表达式替换为与其具有不等关系的其他表达式。如果用户需要在一步推导中替换多个子表达式，多出子表达式的不等关系应当被提前证明。在不等式两边同时乘以一个相同的表达式时，如果该表达式的符号不能由其本身的结构或题设得到，用户需要事先给出其证明。目前不支持使用函数的单调性。例如：
$$ x ^ 2 + x + 2 \ge x + 2 \; (使用 x ^ 2 \ge 0) $$
$$ |\sin{x} \cdot \sin{y}| \le |\sin{x}| \cdot |\sin{y}| \le \varepsilon \; (已事先证明 |\sin{y}| \le \varepsilon)$$

- 三角函数化简规则(tri_identity_solver, tri_sum2product_solver, tri_calculate_solver)：除了可以应用子结构化简规则之外，包含三角函数的一步推导也可以使用一次三角恒等变形公式或者对一个三角函数进行求值。目前支持的三角恒等变形公式有正余弦的平方和公式以及和差化积公式，在应用公式时用户需要显式给出公式的形式，目前支持的求值有 $0,\frac{\pi}{6},\frac{\pi}{3},\frac{\pi}{2},\frac{2\pi}{3},\frac{3\pi}{4},\frac{5\pi}{6},\pi,\frac{7\pi}{6},\frac{5\pi}{4},\frac{4\pi}{3},\frac{3\pi}{2},\frac{5\pi}{3},\frac{7\pi}{4},\frac{11\pi}{6}$ 以及它们加上 $2\pi$ 的整数倍后的正弦、余弦运算。例如：
$$ x\sin{(a + b)} + x\sin{(a - b)} = x(\sin{(a + b)} + \sin{(a - b)}) = 2x\sin{a}\cos{b} $$
$$ \sin{(\pi/2 + 2\pi\lfloor{x}\rfloor)} = 1 $$

- 极限化简规则(lim_replace_solver, lim_rm)：除了可以应用子结构化简规则之外，包含极限的一步推导也可以直接将绑定变量的值带入求值，这实际上是极限定义的一个推论。例如：
$$ \lim_{x \rightarrow 1}{\frac{x + 1}{x + 2}} = \frac{2}{3} $$