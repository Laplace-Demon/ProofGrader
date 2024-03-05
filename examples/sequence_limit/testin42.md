要证：

对于任意 ${ a_n, n \in N }$，若 ${ a_n, n \in N }$ 收敛，则 $\lim\limits_{n \to +\infty}{\lambda * a_n} = \lambda * \lim\limits_{n \to +\infty}{a_n}$

证明：

假设 $\{ a_n, n \in N \}$ 收敛,

根据收敛的定义，$存在l$ ， $\lim\limits_{n \to +\infty}{a_n} = l$,

取 $ \epsilon $，$\epsilon>0$

{

根据极限的定义，$存在N$ ，$任意n$，若$n \ge N$，则$|a_n - l| < \frac{\epsilon}{1 + |\lambda|}$,

因此，$任意n$，若$n \ge N$，则 $|\lambda * a_n - \lambda * l| = |\lambda * (a_n - l)| = |\lambda| * |a_n - l| < \frac{\epsilon * |\lambda|}{1 + |\lambda|} < \epsilon$

}

根据极限定义，$\lim\limits_{n \to +\infty}{\lambda * a_n} = \lambda * l$,

因此，$\lim\limits_{n \to +\infty}{\lambda * a_n} = \lambda * \lim\limits_{n \to +\infty}{a_n}$,

综上可知，原命题得证