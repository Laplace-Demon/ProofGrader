已知：

$a > 0$ 

要证：

若对于任意$n$，$x_n \neq 0$，则若$\lim\limits_{n \to +\infty}{x_n} = a$，则 $\lim\limits_{n \to +\infty}{\frac{x_{n+1}}{x_n}} = 1$

证：

取 $\epsilon$，$\epsilon > 0$

{

易知 $\frac{a * \epsilon}{2 + \epsilon} < a$,

根据极限的定义，$存在N$ 满足 对于任意$n$，若$n \ge N$，则$|x_n - a| < \frac{a * \epsilon}{2 + \epsilon}$,

因此，对于任意$n$，若$n \ge N$，则$-\frac{a * \epsilon}{2 + \epsilon} < x_n - a < \frac{a * \epsilon}{2 + \epsilon}$,

因此，对于任意$n$，若$n \ge N$，则$x_n > a - \frac{a * \epsilon}{2 + \epsilon}$,

因此，对于任意$n$，若$n \ge N$，则$ |x_n| > a - \frac{a * \epsilon}{2 + \epsilon}$,

因此，对于任意$n$，若$n \ge N$，则$|\frac{x_{n+1}}{x_n} - 1| = |\frac{x_{n + 1} - x_n}{x_n}| = \frac{|(x_{n+1} - a) - (x_n - a)|}{|x_n|} \le \frac{|x_{n+1} - a| + |x_n - a|}{|x_n|} < \frac{\frac{a * \epsilon}{2 + \epsilon} + \frac{a * \epsilon}{2 + \epsilon}}{a - \frac{a * \epsilon}{2 + \epsilon}} = \epsilon $

}

根据极限定义可得，$\lim\limits_{n \to +\infty}{\frac{x_{n+1}}{x_n}} = 1$，

综上可知，原命题得证。