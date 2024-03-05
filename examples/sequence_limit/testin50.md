要证：

对于任意 $\{ a_n, n \in N \}$，若对于任意$n$，$a_n \neq 0$，则若$\lim\limits_{n \to +\infty}{a_n} = +\infty$，则 $\lim\limits_{n \to +\infty}{\frac{1}{a_n}} = 0$

证明：

假设对于任意$n$，$a_n \neq 0$,

假设$\lim\limits_{n \to +\infty}{a_n} = +\infty$,

取 $\epsilon$，$\epsilon > 0$

{

根据极限的定义，$存在N$ 满足 对于任意$n$，若$n \ge N$，则$a_n > \frac{1}{\epsilon}$,

因此，对于任意$n$，若$n \ge N$，则$0 < \frac{1}{a_n} < \epsilon$,

因此，对于任意$n$，若$n \ge N$，则$|\frac{1}{a_n} - 0| < \epsilon$

}

根据极限定义可得，$\lim\limits_{n \to +\infty}{\frac{1}{a_n}} = 0$,

综上可知，原命题得证。